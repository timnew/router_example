import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:router_example/features/screen_navigation.dart';

import 'destination_stack.dart';
import 'route_path_visitor.dart';

abstract class DestinationStackParser
    extends RouteInformationParser<DestinationStack> {
  const DestinationStackParser();

  @override
  Future<DestinationStack> parseRouteInformation(
          RouteInformation routeInformation) =>
      SynchronousFuture(
        syncParseRouteInformation(routeInformation.location),
      );

  DestinationStack syncParseRouteInformation(String? location) {
    if (location == null) {
      return onLocationIsNull();
    }

    if (location.isEmpty) {
      return onLocationIsEmpty();
    }

    final visitor = RoutePathVisitor(location);

    var result = buildRootStack();

    while (visitor.hasNext) {
      result = result.pushPath(visitor);
    }

    return result;
  }

  DestinationStack onLocationIsNull() => onLocationIsEmpty();

  DestinationStack onLocationIsEmpty();

  DestinationStack buildRootStack();

  PageFactory buildPageFactory();

  @override
  RouteInformation? restoreRouteInformation(DestinationStack configuration) {
    final location = configuration.buildLocation();

    return RouteInformation(location: location);
  }
}
