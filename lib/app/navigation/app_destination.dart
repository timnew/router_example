import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:router_example/features/screen_navigation.dart';

part 'app_destination.freezed.dart';

@freezed
class HomeDestination with _$HomeDestination, Destination {
  const HomeDestination._();
  const factory HomeDestination() = _HomeDestination;

  @override
  String get name => "";

  @override
  Destination parseChildPath(RoutePathVisitor visitor) {
    switch (visitor.consume()) {
      case "":
        return this;
      case "search":
        return SearchResultDestination(query: visitor.consume());
      case "settings":
        return const SettingsDestination();
      case "bad_destination":
        return BadDestination(
          message: visitor.consume(),
          detail: visitor.consume(),
        );
      default:
        return BadDestination.from(visitor);
    }
  }

  @override
  Iterable<Destination>? tryBuildRootStack() => [this];

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) {
    if (destination is HomeDestination) return const [];

    return null;
  }
}

@freezed
class SearchResultDestination with _$SearchResultDestination, Destination {
  const SearchResultDestination._();

  const factory SearchResultDestination({required String query}) =
      _SearchResultDestination;

  @override
  String get name => "search";

  @override
  Iterable<String> toLocationParts() => [name, query];

  @override
  Destination parseChildPath(RoutePathVisitor visitor) {
    switch (visitor.consume()) {
      case "detail":
        return DetailDestination(title: visitor.consume());
      default:
        return BadDestination.from(visitor);
    }
  }

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) {
    if (destination is HomeDestination) return [this];

    return null;
  }
}

@freezed
class DetailDestination with _$DetailDestination, Destination {
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
        return BadDestination.from(visitor);
    }
  }

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) {
    if (destination is SearchResultDestination) return [this];

    return null;
  }
}

@freezed
class ActionDestination with _$ActionDestination, Destination {
  const ActionDestination._();

  const factory ActionDestination() = _ActionDestination;

  @override
  String get name => "action";

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) {
    if (destination is DetailDestination) return [this];

    return null;
  }
}

@freezed
class SettingsDestination with _$SettingsDestination, Destination {
  const SettingsDestination._();

  const factory SettingsDestination() = _SettingsDestination;

  @override
  String get name => "settings";

  @override
  Iterable<Destination>? tryBuildRootStack() => const [
        HomeDestination(),
        SettingsDestination(),
      ];

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) {
    if (destination is HomeDestination) return [this];
    return null;
  }
}
