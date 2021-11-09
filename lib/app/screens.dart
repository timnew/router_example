import 'package:flutter/material.dart';
import 'package:router_example/app/navigation/app_destination.dart';
import 'package:router_example/features/screen_navigation/navigation_controller_provider.dart';

import 'widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => SimpleScreen(
        title: "Home",
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 400),
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: "Keywords",
            ),
          ),
        ),
        destinations: [
          NavigationButton.builder(
            label: const Text("Search"),
            builder: () => SearchResultDestination(query: _controller.text),
          ),
          AppButton(
            label: const Text("Show Form"),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => SearchForm(controller: _controller),
              );
            },
          ),
          AppButton(
            label: const Text("Show Bogttom Sheet"),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => const RecentSearchSheet(),
              );
            },
          ),
          const NavigationButton(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            label: Text("Settings"),
            destination: SettingsDestination(),
          ),
        ],
      );
}

class SearchForm extends StatelessWidget {
  final TextEditingController controller;
  const SearchForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleDialog(
        title: const Text("Search Form"),
        contentPadding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Keywords",
            ),
          ),
          AppButton(
            label: const Text("Search"),
            onPressed: () {
              Navigator.of(context).pop();
              navigationController.navigateTo(
                SearchResultDestination(query: controller.text),
              );
            },
          ),
        ],
      );
}

class RecentSearchSheet extends StatelessWidget {
  const RecentSearchSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text("Recent 1"),
            onTap: () {
              Navigator.of(context).pop();
              navigationController.navigateTo(
                const SearchResultDestination(query: "recent_1"),
              );
            },
          ),
          ListTile(
            title: const Text("Recent 2"),
            onTap: () {
              Navigator.of(context).pop();
              navigationController.navigateTo(
                const SearchResultDestination(query: "recent_2"),
              );
            },
          ),
          ListTile(
            title: const Text("Recent 1"),
            onTap: () {
              Navigator.of(context).pop();
              navigationController.navigateTo(
                const SearchResultDestination(query: "recent_3"),
              );
            },
          ),
        ],
      );
}

class SearchResultScreen extends StatelessWidget {
  final String query;

  const SearchResultScreen({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleScreen(
        title: "Search Result: $query",
        destinations: [
          NavigationButton(
            label: Text("$query 1"),
            destination: DetailDestination(
              title: "${query}_1",
            ),
          ),
          NavigationButton(
            label: Text("$query 2"),
            destination: DetailDestination(
              title: "${query}_2",
            ),
          ),
          NavigationButton(
            label: Text("$query 3"),
            destination: DetailDestination(
              title: "${query}_3",
            ),
          ),
        ],
      );
}

class DetailScreen extends StatelessWidget {
  final String query;
  final String title;

  const DetailScreen({
    Key? key,
    required this.query,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleScreen(
        title: "Detail: $title",
        destinations: const [
          NavigationButton(
            label: Text("Action"),
            destination: ActionDestination(),
          ),
        ],
      );
}

class ActionScreen extends StatelessWidget {
  final String query;
  final String title;

  const ActionScreen({
    Key? key,
    required this.query,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleScreen(
        title: "Action: $title",
        destinations: const [
          NavigationButton(
            label: Text("Settings"),
            destination: SettingsDestination(),
          ),
        ],
      );
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SimpleScreen(title: "Settings");
}

class NavigationErrorScreen extends StatelessWidget {
  final String message;
  final String location;

  const NavigationErrorScreen({
    Key? key,
    required this.message,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleScreen(
        title: "Page Not Found",
        child: Center(
          child: Column(
            children: [
              Text(message, style: Theme.of(context).textTheme.headline6),
              Text(location),
            ],
          ),
        ),
        destinations: const [
          NavigationButton(
            label: Text("Return Home"),
            destination: HomeDestination(),
          ),
          NavigationButton(
            label: Text("Settings"),
            destination: SettingsDestination(),
          ),
        ],
      );
}
