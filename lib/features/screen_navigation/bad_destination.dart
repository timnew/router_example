import 'package:router_example/features/screen_navigation/route_path_visitor.dart';

import 'package:router_example/features/screen_navigation/destination_stack.dart';

import 'destination.dart';

class BadDestination with Destination {
  final String message;
  final String detail;

  BadDestination({
    required this.message,
    required this.detail,
  });

  factory BadDestination.emptyLocation({
    String message = "Empty Location",
    String detail = "",
  }) =>
      BadDestination(message: message, detail: detail);

  factory BadDestination.unknownLocation(
    String location, {
    String message = "Unknown Location",
  }) =>
      BadDestination(message: message, detail: location);

  factory BadDestination.from(RoutePathVisitor visitor) =>
      BadDestination.unknownLocation(visitor.badLocation());

  factory BadDestination.unreachableLocation({
    required DestinationStack from,
    required Destination to,
    String message = "Unreachable Location",
  }) =>
      BadDestination(
        message: message,
        detail: "${from.allNodes.toList(growable: false)} -> $to",
      );

  @override
  String get name => "bad_destination";

  @override
  Destination parseChildPath(RoutePathVisitor visitor) =>
      BadDestination.from(visitor);

  @override
  Iterable<Destination>? tryBuildRootStack() => [this];

  @override
  Iterable<Destination>? tryNavigateFrom(Destination destination) => null;

  @override
  bool operator ==(Object other) =>
      other is BadDestination &&
      (identical(other.message, message) || message == other.message) &&
      (identical(other.detail, detail) || other.detail == detail);

  @override
  int get hashCode => Object.hash(runtimeType, message, detail);
}
