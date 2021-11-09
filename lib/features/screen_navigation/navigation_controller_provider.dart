import 'navigation_controller.dart';

typedef NavigationControllerProvider = NavigationController Function();

late NavigationControllerProvider _provider;

void registerNavigationControllerProvider(
  NavigationControllerProvider provider,
) {
  _provider = provider;
}

NavigationController navigationController() => _provider();
