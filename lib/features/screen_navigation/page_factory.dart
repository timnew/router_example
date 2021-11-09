import 'package:flutter/material.dart';

import 'destination.dart';

typedef PageBuilder<D extends Destination> = Page Function(
  BuildContext context,
  D destination,
);

typedef ScreenWidgetBuilder<D extends Destination> = Widget Function(
  BuildContext context,
  D destination,
);

class PageFactory {
  final List<_FactoryItem> _factories = [];

  PageFactory();

  void page<D extends Destination>(PageBuilder<D> pageFactory) {
    _factories.add(_FactoryItem<D>.page(pageFactory));
  }

  void screen<D extends Destination>(
    ScreenWidgetBuilder<D> screenWidgetFactory,
  ) {
    _factories.add(_FactoryItem<D>.screen(screenWidgetFactory));
  }

  Page buildPage(BuildContext context, Destination destination) {
    final factory = _factories.firstWhere(
      (f) => f.canBuild(destination),
      orElse: () => throw ArgumentError(
        "No factory registered for $destination",
      ),
    );

    return factory.build(context, destination);
  }
}

class _FactoryItem<D extends Destination> {
  final PageBuilder build;

  _FactoryItem(this.build);

  factory _FactoryItem.page(PageBuilder<D> pageBuilder) => _FactoryItem(
        (c, d) => pageBuilder(c, d as D),
      );

  factory _FactoryItem.screen(ScreenWidgetBuilder<D> screenWidgetBuilder) =>
      _FactoryItem(
        (c, d) => MaterialPage(
          key: d.key,
          restorationId: d.restorationId,
          child: screenWidgetBuilder(c, d as D),
        ),
      );

  bool canBuild(Destination destination) => destination is D;
}
