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
    // TODO: implement buildPageFactory
    throw UnimplementedError();
  }
}
