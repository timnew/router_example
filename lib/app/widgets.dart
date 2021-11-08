import 'package:flutter/material.dart';

import 'navigation/navigation_item.dart';
import 'navigation/navigation_stack.dart';

class SimpleScreen extends StatelessWidget {
  final String title;
  final Widget? child;
  final List<Widget>? destinations;

  const SimpleScreen({
    Key? key,
    required this.title,
    this.child,
    this.destinations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (child != null) child!,
                if (destinations != null) ...destinations!,
              ],
            ),
          ),
        ),
      );
}

typedef DestinationBuilder = NavigationItem Function(BuildContext context);

class NavigationButton extends StatelessWidget {
  final Widget label;
  final NavigationItem? destination;
  final DestinationBuilder? builder;

  const NavigationButton.builder({
    Key? key,
    required this.label,
    required DestinationBuilder this.builder,
  })  : destination = null,
        super(key: key);

  const NavigationButton({
    Key? key,
    required this.label,
    required NavigationItem this.destination,
  })  : builder = null,
        super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
        icon: const Icon(Icons.golf_course),
        label: label,
        onPressed: () =>
            NavigationStack.it.goTo(destination ?? builder!(context)),
      );
}
