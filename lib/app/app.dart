import 'package:flutter/material.dart';
import 'package:router_example/app/navigation/navigation_stack.dart';

import 'navigation/app_route_info_parser.dart';
import 'navigation/navigation_delegate.dart';

final GlobalKey<AppState> _appStateKey = GlobalKey<AppState>();

class App extends StatefulWidget {
  static AppState get state => _appStateKey.currentState!;

  App() : super(key: _appStateKey);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  late NavigationStack _navigationStack;
  late AppRouteDelegate _appRouteDelegate;
  late AppRouteInfoParser _appRouteInfoParser;

  @override
  void initState() {
    super.initState();

    _navigationStack = NavigationStack();

    NavigationStack.navigationStackProvider =
        () => _appStateKey.currentState!._navigationStack;

    _appRouteDelegate = AppRouteDelegate(_navigationStack);
    _appRouteInfoParser = AppRouteInfoParser();
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Flutter Router Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routeInformationParser: _appRouteInfoParser,
        routerDelegate: _appRouteDelegate,
      );
}
