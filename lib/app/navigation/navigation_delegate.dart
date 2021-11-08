import 'package:flutter/material.dart';

import '../screens.dart';
import 'navigation_item.dart';
import 'navigation_stack.dart';

class AppRouteDelegate extends RouterDelegate<NavigationStack>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final NavigationStack stack;

  AppRouteDelegate(this.stack) {
    stack.addListener(notifyListeners);
  }

  @override
  void dispose() {
    stack.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        pages: _buildPages(context, stack.items),
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          stack.pop();
          return true;
        },
      );

  @override
  NavigationStack get currentConfiguration => stack;

  @override
  Future<void> setNewRoutePath(NavigationStack configuration) async {
    stack.complexUpdate((builder) => builder.replace(configuration.items));
  }

  List<Page> _buildPages(
    BuildContext context,
    Iterable<NavigationItem> items,
  ) =>
      items
          .map(
            (item) => item.map(
              home: HomeScreen.createPage,
              searchResult: SearchResultScreen.createPage,
              detail: DetailScreen.createPage,
              action: ActionScreen.createPage,
              settings: SettingsScreen.createPage,
              notFound: NotFoundScreen.createPage,
            ),
          )
          .toList(growable: false);
}
