import 'package:flutter/material.dart';
import 'package:router_example/features/screen_navigation.dart';

import 'navigation/app_navigation_parser.dart';

final GlobalKey<AppState> _appStateKey = GlobalKey<AppState>();

class App extends StatefulWidget {
  static AppState get state => _appStateKey.currentState!;

  App() : super(key: _appStateKey);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  late NavigationController _navigationController;
  late AppDestinationStackParser _locationParser;

  @override
  void initState() {
    super.initState();

    _locationParser = const AppDestinationStackParser();

    _navigationController = NavigationController(
      _locationParser.buildPageFactory(),
      _locationParser.buildRootStack(),
    );

    registerNavigationControllerProvider(
      () => _appStateKey.currentState!._navigationController,
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Flutter Router Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: _locationParser,
        routerDelegate: _navigationController,
      );
}
