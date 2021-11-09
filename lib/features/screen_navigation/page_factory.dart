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
  final Map<Type, PageBuilder> _pageFactories = <Type, PageBuilder>{};

  PageFactory();

  void pageFactory<D extends Destination>(PageBuilder<D> pageFactory) {
    _pageFactories[D] = (c, d) => pageFactory(c, d as D);
  }

  void screenFactory<D extends Destination>(
    ScreenWidgetBuilder<D> screenWidgetFactory,
  ) {
    _pageFactories[D] = (c, d) => MaterialPage(
          key: d.key,
          restorationId: d.restorationId,
          child: screenWidgetFactory(c, d as D),
        );
  }

  Page buildPage(BuildContext context, Destination destination) {
    final type = destination.runtimeType;
    final factory = _pageFactories[type];
    if (factory == null) {
      throw ArgumentError(
        'No factory registered for type $type',
      );
    }
    return factory(context, destination);
  }
}
