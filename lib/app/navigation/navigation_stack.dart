import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_item.dart';

typedef StackUpdater<T> = T Function(ListBuilder<NavigationItem> builder);

class NavigationStack with ChangeNotifier {
  static late NavigationStack Function() navigationStackProvider;

  static NavigationStack get it => navigationStackProvider();

  BuiltList<NavigationItem> _items;

  NavigationItem? get current => _items.lastOrNull;

  NavigationStack([Iterable<NavigationItem> items = const []])
      : _items = BuiltList<NavigationItem>(items);

  factory NavigationStack.home() => NavigationStack(const [
        NavigationItem.home(),
      ]);

  factory NavigationStack.notFound(String location) => NavigationStack([
        NavigationItem.notFound(location: location),
      ]);

  BuiltList<NavigationItem> get items => _items;

  T complexUpdate<T>(StackUpdater<T> update) {
    final builder = _items.toBuilder();
    final result = update(builder);
    final newItems = builder.build();

    if (newItems != _items) {
      _items = newItems;
      notifyListeners();
    }

    return result;
  }

  NavigationItem? pop() => complexUpdate(
        (builder) => builder.length > 0 ? builder.removeLast() : null,
      );

  void goTo(NavigationItem desination) =>
      complexUpdate((builder) => builder.replace(desination.buildFullStack()));

  Provider<NavigationStack> createProvider({Widget? child}) =>
      Provider<NavigationStack>.value(
        value: this,
        child: child,
      );
}
