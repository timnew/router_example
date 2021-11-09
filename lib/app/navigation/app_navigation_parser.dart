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
      ..screenFactory<HomeDestination>(
          (context, destination) => const HomeScreen())
      ..screenFactory<SearchResultDestination>((context, destination) =>
          SearchResultScreen(query: destination.query))
      ..screenFactory<DetailDestination>((context, destination) => DetailScreen(
            query: "",
            title: destination.title,
          ))
      ..screenFactory<ActionDestination>(
          (context, destination) => ActionScreen(query: "", title: ""))
      ..screenFactory<SettingsDestination>(
          (context, destination) => const SettingsScreen())
      ..screenFactory<BadNavigationDestination>(
          (context, destination) => NavigationErrorScreen(
                message: destination.message,
                location: destination.detail,
              ));

    return result;
  }
}
