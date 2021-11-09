import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:router_example/features/screen_navigation.dart';

part 'app_destination.freezed.dart';

abstract class AppDestination with Destination {
  const AppDestination();

  @override
  DestinationStack unableToReachFrom(DestinationStack from) =>
      from.push(BadNavigationDestination.unableNavigate(from: from, to: this));
}

@freezed
class BadNavigationDestination extends AppDestination
    with _$BadNavigationDestination {
  const BadNavigationDestination._();

  const factory BadNavigationDestination({
    required String message,
    required String detail,
  }) = _BadNavigationDestination;

  factory BadNavigationDestination.emptyLocation() =>
      const BadNavigationDestination(
        message: "No Location",
        detail: "",
      );

  factory BadNavigationDestination.unknownLocation(String location) =>
      BadNavigationDestination(
        message: "Unknown Location",
        detail: location,
      );

  factory BadNavigationDestination.unableNavigate({
    required DestinationStack from,
    required AppDestination to,
  }) =>
      BadNavigationDestination(
        message: "Unable to navigate",
        detail: "${from.current} -> $to",
      );

  @override
  String get name => "404";

  @override
  Destination parseChildPath(RoutePathVisitor visitor) {
    visitor.badLocation();
    return this;
  }

  @override
  Iterable<String> toLocationParts() => [name, message, detail];

  @override
  Iterable<Destination>? tryBuildRootStack() => [this];

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) => null;
}

@freezed
class HomeDestination extends AppDestination with _$HomeDestination {
  const HomeDestination._();
  const factory HomeDestination() = _HomeDestination;

  @override
  String get name => "home";

  @override
  Destination parseChildPath(RoutePathVisitor visitor) {
    switch (visitor.consume()) {
      case "search":
        return SearchResultDestination(query: visitor.consume());
      case "settings":
        return const SettingsDestination();
      case "404":
        return BadNavigationDestination(
          message: visitor.consume(),
          detail: visitor.consume(),
        );
      default:
        return BadNavigationDestination.unknownLocation(visitor.badLocation());
    }
  }

  @override
  Iterable<Destination>? tryBuildRootStack() => [this];

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) => null;
}

@freezed
class SearchResultDestination extends AppDestination
    with _$SearchResultDestination {
  const SearchResultDestination._();

  const factory SearchResultDestination({required String query}) =
      _SearchResultDestination;

  @override
  String get name => "/search";

  @override
  Iterable<String> toLocationParts() => [name, query];

  @override
  Destination parseChildPath(RoutePathVisitor visitor) {
    switch (visitor.consume()) {
      case "detail":
        return DetailDestination(title: visitor.consume());
      default:
        return BadNavigationDestination.unknownLocation(visitor.badLocation());
    }
  }

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) {
    if (destination is HomeDestination) {
      return [this];
    }

    return null;
  }
}

@freezed
class DetailDestination extends AppDestination with _$DetailDestination {
  const DetailDestination._();

  const factory DetailDestination({required String title}) = _DetailDestination;

  @override
  String get name => "detail";

  @override
  Iterable<String> toLocationParts() => [name, title];

  @override
  Destination parseChildPath(RoutePathVisitor visitor) {
    switch (visitor.consume()) {
      case "action":
        return const ActionDestination();
      default:
        return BadNavigationDestination.unknownLocation(visitor.badLocation());
    }
  }

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) {
    if (destination is SearchResultDestination) {
      return [this];
    }

    return null;
  }
}

@freezed
class ActionDestination extends AppDestination with _$ActionDestination {
  const ActionDestination._();

  const factory ActionDestination() = _ActionDestination;

  @override
  String get name => "action";

  @override
  Destination parseChildPath(RoutePathVisitor visitor) =>
      BadNavigationDestination.unknownLocation(visitor.badLocation());

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) {
    if (destination is DetailDestination) {
      return [this];
    }

    return null;
  }
}

@freezed
class SettingsDestination extends AppDestination with _$SettingsDestination {
  const SettingsDestination._();

  const factory SettingsDestination() = _SettingsDestination;

  @override
  String get name => "settings";

  @override
  Destination parseChildPath(RoutePathVisitor visitor) =>
      BadNavigationDestination.unknownLocation(visitor.badLocation());

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) => [this];
}
