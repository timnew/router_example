import 'package:router_example/app/screens.dart';
import 'package:router_example/features/screen_navigation.dart';

import 'app_destination.dart';

class AppDestinationStackParser extends DestinationStackParser {
  const AppDestinationStackParser();

  @override
  DestinationStack buildRootStack() =>
      const HomeDestination().asSingleNodeStack();

  @override
  DestinationStack onLocationIsEmpty() =>
      BadNavigationDestination.emptyLocation().asSingleNodeStack();

  @override
  PageFactory buildPageFactory() {
    final result = PageFactory();

    result
      ..screen<HomeDestination>(
        (context, stack) => const HomeScreen(),
      )
      ..screen<SearchResultDestination>(
        (context, stack) => SearchResultScreen(
          query: stack.as<SearchResultDestination>().query,
        ),
      )
      ..screen<DetailDestination>(
        (context, stack) => DetailScreen(
          query: stack.find<SearchResultDestination>()!.query,
          title: stack.as<DetailDestination>().title,
        ),
      )
      ..screen<ActionDestination>(
        (context, stack) => ActionScreen(
          query: stack.find<SearchResultDestination>()!.query,
          title: stack.find<DetailDestination>()!.title,
        ),
      )
      ..screen<SettingsDestination>(
        (context, destination) => const SettingsScreen(),
      )
      ..screen<BadNavigationDestination>(
        (context, stack) => NavigationErrorScreen(
          message: stack.as<BadNavigationDestination>().message,
          location: stack.as<BadNavigationDestination>().detail,
        ),
      );

    return result;
  }
}
