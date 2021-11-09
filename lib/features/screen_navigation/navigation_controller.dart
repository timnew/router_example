import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'destination.dart';
import 'destination_stack.dart';
import 'page_factory.dart';

class NavigationController extends RouterDelegate<DestinationStack>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<DestinationStack> {
  @override
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final PageFactory pageFactory;

  DestinationStack _current;

  NavigationController({
    required this.pageFactory,
    required DestinationStack initialStack,
  }) : _current = initialStack;

  @protected
  void setCurrent(DestinationStack value) {
    _current = value;
    notifyListeners();
  }

  @override
  DestinationStack get currentConfiguration => _current;

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        pages: buildPages(context),
        onPopPage: onPopPage,
      );

  List<Page> buildPages(BuildContext context) => _current.allStacks
      .map((s) => pageFactory.buildPage(context, s))
      .toList(growable: false);

  bool onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }

    setCurrent(_current.pop());

    return true;
  }

  @override
  Future<void> setNewRoutePath(DestinationStack configuration) {
    setCurrent(configuration);

    return SynchronousFuture<void>(null);
  }

  void navigateTo(Destination destination) {
    setCurrent(_current.navigateTo(destination));
  }
}
