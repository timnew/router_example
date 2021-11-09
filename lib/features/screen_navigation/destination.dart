import 'package:flutter/material.dart';

import 'bad_destination.dart';
import 'route_path_visitor.dart';

mixin Destination {
  String get name;

  LocalKey get key => ValueKey(this);
  String? get restorationId => null;

  Iterable<String> toLocationParts() => [name];

  Iterable<Destination>? tryNavigateFrom(Destination destination) => null;
  Iterable<Destination>? tryBuildRootStack() => null;

  Destination parseChildPath(RoutePathVisitor visitor) =>
      BadDestination.from(visitor);
}
