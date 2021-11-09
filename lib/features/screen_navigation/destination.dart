import 'package:flutter/material.dart';

import 'destination_stack.dart';
import 'route_path_visitor.dart';

mixin Destination {
  String get name;

  LocalKey get key => ValueKey(this);
  String? get restorationId => null;

  @override
  bool operator ==(Object other);

  Iterable<String> toLocationParts() => [name];

  Iterable<Destination>? tryNavigateFrom(Destination destination);
  Iterable<Destination>? tryBuildRootStack() => null;

  Destination parseChildPath(RoutePathVisitor visitor);

  DestinationStack unableToReachFrom(DestinationStack from);
}
