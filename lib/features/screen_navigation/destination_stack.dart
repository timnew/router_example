import 'package:built_collection/built_collection.dart';

import 'destination.dart';
import 'route_path_visitor.dart';

typedef StackUpdater = void Function(ListBuilder<Destination> b);
typedef DestionPredicate = bool Function(Destination d);

class DestinationStack {
  final BuiltList<Destination> allNodes;

  DestinationStack._(Iterable<Destination> nodes)
      : assert(nodes.isNotEmpty),
        allNodes = BuiltList.of(nodes);

  factory DestinationStack.root(Destination node) => DestinationStack._([node]);

  Destination get current => allNodes.last;
  Destination? get parentNode =>
      allNodes.length > 1 ? allNodes[allNodes.length - 2] : null;

  Destination rootNode() => allNodes.first;

  int get depth => allNodes.length;

  bool get isRoot => depth == 1;

  String buildLocation() =>
      allNodes.expand((d) => d.toLocationParts()).join('/');

  DestinationStack update(StackUpdater updater) =>
      DestinationStack._(allNodes.rebuild(updater));

  DestinationStack pop() => isRoot ? this : update((b) => b.removeLast());

  DestinationStack push(Destination node) => update((b) => b.add(node));

  DestinationStack popUntil(DestionPredicate criteria) => update((b) {
        while (b.isNotEmpty && !criteria(b.last)) {
          b.removeLast();
        }
      });

  DestinationStack pushAll(Iterable<Destination> nodes) => update((b) {
        b.addAll(nodes);
      });

  DestinationStack navigateTo(Destination node) {
    if (allNodes.contains(node)) {
      return popUntil(
        (d) => d == node,
      );
    }

    final popped = allNodes.rebuild((b) {
      while (b.isNotEmpty) {
        final newNodes = node.tryNavigateFrom(b.last);
        if (newNodes != null) {
          assert(newNodes.last == node);
          b.addAll(newNodes);
          break;
        }
        b.removeLast();
      }
    });

    if (popped.isNotEmpty && popped.last == node) {
      return DestinationStack._(popped);
    }

    assert(popped.isEmpty);

    final newNodes = node.tryBuildRootStack();

    if (newNodes != null && newNodes.isNotEmpty) {
      assert(newNodes.last == node);

      return DestinationStack._(newNodes);
    }

    return node.unableToReachFrom(this);
  }

  DestinationStack pushPath(RoutePathVisitor visitor) {
    print("Push ${visitor.peek} on $current");
    final destination = current.parseChildPath(visitor);
    return navigateTo(destination);
  }
}

extension DestinationExtension on Destination {
  DestinationStack asSingleNodeStack() => DestinationStack.root(this);
}
