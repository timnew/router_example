import 'package:flutter/material.dart';
import 'package:router_example/app/navigation/navigation_stack.dart';

import 'navigation/navigation_item.dart';
import 'widgets.dart';

class HomeScreen extends StatefulWidget {
  static MaterialPage createPage(HomeItem item) => const MaterialPage(
        key: ValueKey(HomeScreen),
        child: HomeScreen(),
      );

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
            builder: () => NavigationItem.searchResult(query: _controller.text),
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
            destination: NavigationItem.settings(),
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
              NavigationStack.it
                  .goTo(NavigationItem.searchResult(query: controller.text));
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
              NavigationStack.it.goTo(
                const NavigationItem.searchResult(query: "recent_1"),
              );
            },
          ),
          ListTile(
            title: const Text("Recent 2"),
            onTap: () {
              Navigator.of(context).pop();
              NavigationStack.it.goTo(
                const NavigationItem.searchResult(query: "recent_2"),
              );
            },
          ),
          ListTile(
            title: const Text("Recent 1"),
            onTap: () {
              Navigator.of(context).pop();
              NavigationStack.it.goTo(
                const NavigationItem.searchResult(query: "recent_1"),
              );
            },
          ),
        ],
      );
}

class SearchResultScreen extends StatelessWidget {
  static MaterialPage createPage(SearchResultItem item) => MaterialPage(
        key: ValueKey(item),
        child: SearchResultScreen(query: item.query),
      );

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
            destination: NavigationItem.detail(
              query: query,
              title: "${query}_1",
            ),
          ),
          NavigationButton(
            label: Text("$query 2"),
            destination: NavigationItem.detail(
              query: query,
              title: "${query}_2",
            ),
          ),
          NavigationButton(
            label: Text("$query 3"),
            destination: NavigationItem.detail(
              query: query,
              title: "${query}_3",
            ),
          ),
        ],
      );
}

class DetailScreen extends StatelessWidget {
  static MaterialPage createPage(DetailItem item) => MaterialPage(
        key: ValueKey(item),
        child: DetailScreen(
          query: item.query,
          title: item.title,
        ),
      );

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
        destinations: [
          NavigationButton(
            label: const Text("Action"),
            destination: NavigationItem.action(query: query, title: title),
          ),
        ],
      );
}

class ActionScreen extends StatelessWidget {
  static MaterialPage createPage(ActionItem item) => MaterialPage(
        key: ValueKey(item),
        child: ActionScreen(
          query: item.query,
          title: item.title,
        ),
      );

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
            destination: NavigationItem.settings(),
          ),
        ],
      );
}

class SettingsScreen extends StatelessWidget {
  static MaterialPage createPage(SettingsItem item) => const MaterialPage(
        key: ValueKey(SettingsScreen),
        child: SettingsScreen(),
      );

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const SimpleScreen(title: "Settings");
}

class NotFoundScreen extends StatelessWidget {
  static MaterialPage createPage(NotFoundItem item) => MaterialPage(
        key: ValueKey(item),
        child: NotFoundScreen(
          message: item.message,
          location: item.location,
        ),
      );

  final String message;
  final String location;

  const NotFoundScreen({
    Key? key,
    required this.message,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SimpleScreen(
        title: "Page Not Found",
        child: ListTile(
          title: Text(message),
          subtitle: Text(location),
        ),
        destinations: const [
          NavigationButton(
            label: Text("Return Home"),
            destination: NavigationItem.home(),
          ),
        ],
      );
}
