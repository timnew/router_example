// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:router_example/app/navigation/navigation_item.dart';
import 'navigation_stack.dart';

class AppRouteInfoParser extends RouteInformationParser<NavigationStack> {
  @override
  Future<NavigationStack> parseRouteInformation(
    RouteInformation routeInformation,
  ) {
    final parsed = _parseLocation(routeInformation.location);
    print("parseRouteInformation: ${parsed.items}");
    return SynchronousFuture(parsed);
  }

  NavigationStack _parseLocation(String? location) {
    if (location == null) {
      return NavigationStack.notFound("");
    }
    print("location: $location");
    final parts = location.split("/").reversed.toList();

    print("parts: $parts");

    final items = <NavigationItem>[];

    while (parts.isNotEmpty) {
      print("visit ${parts.last}");
      switch (parts.removeLast()) {
        case "":
          if (items.isEmpty) {
            items.add(const NavigationItem.home());
          }
          break;
        case "q":
          if (items.isEmpty) {
            items.add(const NavigationItem.home());
          }
          items.add(NavigationItem.searchResult(query: parts.removeLast()));
          break;
        case "i":
          final previous = items.last as SearchResultItem;
          items.add(NavigationItem.detail(
              query: previous.query, title: parts.removeLast()));
          break;
        case "action":
          final previous = items.last as DetailItem;
          items.add(NavigationItem.action(
              query: previous.query, title: previous.title));
          break;
        case "setings":
          if (items.isEmpty) {
            items.add(const NavigationItem.home());
          }
          items.add(const NavigationItem.settings());
          break;
        default:
          return NavigationStack.notFound(location);
      }
    }

    if (items.isEmpty) {
      return NavigationStack.notFound(location);
    }

    return NavigationStack(items);
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationStack configuration) {
    final location = configuration.items
        .map(
          (item) => item.map(
            home: (i) => "",
            searchResult: (i) => "q/${i.query}",
            detail: (i) => "i/${i.title}",
            action: (i) => "action",
            settings: (i) => "settings",
            notFound: (i) => i.location,
          ),
        )
        .join("/");

    return RouteInformation(location: location);
  }
}
