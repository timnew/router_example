import 'package:freezed_annotation/freezed_annotation.dart';

part 'navigation_item.freezed.dart';

@freezed
abstract class NavigationItem implements _$NavigationItem {
  const NavigationItem._();

  const factory NavigationItem.home() = HomeItem;
  const factory NavigationItem.searchResult({
    required String query,
  }) = SearchResultItem;

  const factory NavigationItem.detail({
    required String query,
    required String title,
  }) = DetailItem;

  const factory NavigationItem.action({
    required String query,
    required String title,
  }) = ActionItem;

  const factory NavigationItem.settings() = SettingsItem;

  const factory NavigationItem.notFound({
    required String location,
    @Default("404") String message,
  }) = NotFoundItem;

  NavigationItem? _buildParent() => map(
        home: (_) => null,
        searchResult: (_) => const NavigationItem.home(),
        detail: (i) => NavigationItem.searchResult(query: i.query),
        action: (i) => NavigationItem.detail(
          query: i.query,
          title: i.title,
        ),
        settings: (_) => const NavigationItem.home(),
        notFound: (_) => null,
      );

  List<NavigationItem> buildFullStack() {
    final result = <NavigationItem>[this];

    while (true) {
      final parent = result.last._buildParent();
      if (parent == null) return result.reversed.toList();
      result.add(parent);
    }
  }
}
