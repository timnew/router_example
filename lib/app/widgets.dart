import 'package:flutter/material.dart';
import 'package:router_example/features/screen_navigation.dart';

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

typedef DestinationBuilder = Destination Function();

class AppButton extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget label;
  final VoidCallback onPressed;

  const AppButton({
    Key? key,
    this.padding = const EdgeInsets.all(8),
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding,
        child: OutlinedButton.icon(
          icon: const Icon(Icons.golf_course),
          label: label,
          onPressed: onPressed,
        ),
      );
}

class NavigationButton extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Widget label;
  final Destination? destination;
  final DestinationBuilder? builder;

  const NavigationButton.builder({
    Key? key,
    this.padding = const EdgeInsets.all(8.0),
    required this.label,
    required DestinationBuilder this.builder,
  })  : destination = null,
        super(key: key);

  const NavigationButton({
    Key? key,
    this.padding = const EdgeInsets.all(8.0),
    required this.label,
    required Destination this.destination,
  })  : builder = null,
        super(key: key);

  @override
  Widget build(BuildContext context) => AppButton(
        padding: padding,
        label: label,
        onPressed: () =>
            navigationController().navigateTo(destination ?? builder!()),
      );
}
