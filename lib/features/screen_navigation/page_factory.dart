import 'package:flutter/material.dart';

import 'destination.dart';
import 'destination_stack.dart';

typedef PageBuilder = Page Function(
  BuildContext context,
  DestinationStack stack,
);

typedef ScreenWidgetBuilder = Widget Function(
  BuildContext context,
  DestinationStack stack,
);

class PageFactory {
  final List<_FactoryItem> _factories = [];

  PageFactory();

  void page<D extends Destination>(PageBuilder pageFactory) {
    _factories.add(_FactoryItem<D>.page(pageFactory));
  }

  void screen<D extends Destination>(
    ScreenWidgetBuilder screenWidgetFactory,
  ) {
    _factories.add(_FactoryItem<D>.screen(screenWidgetFactory));
  }

  Page buildPage(BuildContext context, DestinationStack stack) {
    final factory = _factories.firstWhere(
      (f) => f.canBuild(stack.current),
      orElse: () => throw ArgumentError(
        "No factory registered for ${stack.current}",
      ),
    );

    return factory.build(context, stack);
  }
}

class _FactoryItem<D extends Destination> {
  final PageBuilder build;

  _FactoryItem.page(this.build);

  factory _FactoryItem.screen(ScreenWidgetBuilder screenWidgetBuilder) =>
      _FactoryItem.page(
        (c, s) => MaterialPage(
          key: s.current.key,
          restorationId: s.current.restorationId,
          child: screenWidgetBuilder(c, s),
        ),
      );

  bool canBuild(Destination destination) => destination is D;
}
