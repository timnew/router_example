import 'package:built_collection/built_collection.dart';

import 'bad_destination.dart';
import 'destination.dart';
import 'route_path_visitor.dart';

typedef StackUpdater = void Function(ListBuilder<Destination> b);
typedef DestionPredicate = bool Function(Destination d);

class DestinationStack {
  final DestinationStack? _stack;
  final Destination current;

  DestinationStack._(this._stack, this.current);

  factory DestinationStack.root(Destination node) =>
      DestinationStack._(null, node);

  Iterable<Destination> get allNodes sync* {
    if (_stack != null) {
      yield* _stack!.allNodes;
    }
    yield current;
  }

  Iterable<DestinationStack> get allStacks sync* {
    if (_stack != null) {
      yield* _stack!.allStacks;
    }
    yield this;
  }

  D as<D extends Destination>() => current as D;
  D? safeAs<D extends Destination>() => current is D ? current as D : null;
  D? find<D extends Destination>() => safeAs<D>() ?? _stack?.find<D>();

  int get depth => _stack?.depth ?? 0 + 1;

  bool get isRoot => _stack == null;

  String buildLocation() =>
      allNodes.expand((d) => d.toLocationParts()).join('/');

  DestinationStack pop() => _stack != null ? _stack! : this;

  DestinationStack push(Destination node) => DestinationStack._(this, node);

  DestinationStack pushAll(Iterable<Destination> nodes) {
    if (nodes.isEmpty) return this;
    final stack = DestinationStack._(this, nodes.first);
    return stack.pushAll(nodes.skip(1));
  }

  DestinationStack popUntil(DestionPredicate criteria) =>
      isRoot && criteria(current) ? this : _stack!.popUntil(criteria);

  DestinationStack navigateTo(Destination node, {DestinationStack? origin}) {
    if (current == node) {
      return this;
    }
    final newNodes = node.tryNavigateFrom(current);
    if (newNodes != null) {
      return pushAll(newNodes);
    }

    if (isRoot) {
      final rootNodes = node.tryBuildRootStack();
      if (rootNodes != null && rootNodes.isNotEmpty) {
        return DestinationStack.root(rootNodes.first)
            .pushAll(rootNodes.skip(1));
      }

      return BadDestination.unreachableLocation(from: origin ?? this, to: node)
          .asSingleNodeStack();
    }

    return _stack!.navigateTo(node, origin: origin ?? this);
  }

  DestinationStack pushPath(RoutePathVisitor visitor) {
    final destination = current.parseChildPath(visitor);
    return navigateTo(destination);
  }
}

extension DestinationExtension on Destination {
  DestinationStack asSingleNodeStack() => DestinationStack.root(this);
}
