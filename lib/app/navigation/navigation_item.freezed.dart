// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navigation_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NavigationItemTearOff {
  const _$NavigationItemTearOff();

  HomeItem home() {
    return const HomeItem();
  }

  SearchResultItem searchResult({required String query}) {
    return SearchResultItem(
      query: query,
    );
  }

  DetailItem detail({required String query, required String title}) {
    return DetailItem(
      query: query,
      title: title,
    );
  }

  ActionItem action({required String query, required String title}) {
    return ActionItem(
      query: query,
      title: title,
    );
  }

  SettingsItem settings() {
    return const SettingsItem();
  }

  NotFoundItem notFound({required String location, String message = "404"}) {
    return NotFoundItem(
      location: location,
      message: message,
    );
  }
}

/// @nodoc
const $NavigationItem = _$NavigationItemTearOff();

/// @nodoc
mixin _$NavigationItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(String query) searchResult,
    required TResult Function(String query, String title) detail,
    required TResult Function(String query, String title) action,
    required TResult Function() settings,
    required TResult Function(String location, String message) notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeItem value) home,
    required TResult Function(SearchResultItem value) searchResult,
    required TResult Function(DetailItem value) detail,
    required TResult Function(ActionItem value) action,
    required TResult Function(SettingsItem value) settings,
    required TResult Function(NotFoundItem value) notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavigationItemCopyWith<$Res> {
  factory $NavigationItemCopyWith(
          NavigationItem value, $Res Function(NavigationItem) then) =
      _$NavigationItemCopyWithImpl<$Res>;
}

/// @nodoc
class _$NavigationItemCopyWithImpl<$Res>
    implements $NavigationItemCopyWith<$Res> {
  _$NavigationItemCopyWithImpl(this._value, this._then);

  final NavigationItem _value;
  // ignore: unused_field
  final $Res Function(NavigationItem) _then;
}

/// @nodoc
abstract class $HomeItemCopyWith<$Res> {
  factory $HomeItemCopyWith(HomeItem value, $Res Function(HomeItem) then) =
      _$HomeItemCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeItemCopyWithImpl<$Res> extends _$NavigationItemCopyWithImpl<$Res>
    implements $HomeItemCopyWith<$Res> {
  _$HomeItemCopyWithImpl(HomeItem _value, $Res Function(HomeItem) _then)
      : super(_value, (v) => _then(v as HomeItem));

  @override
  HomeItem get _value => super._value as HomeItem;
}

/// @nodoc

class _$HomeItem extends HomeItem {
  const _$HomeItem() : super._();

  @override
  String toString() {
    return 'NavigationItem.home()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeItem);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(String query) searchResult,
    required TResult Function(String query, String title) detail,
    required TResult Function(String query, String title) action,
    required TResult Function() settings,
    required TResult Function(String location, String message) notFound,
  }) {
    return home();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
  }) {
    return home?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeItem value) home,
    required TResult Function(SearchResultItem value) searchResult,
    required TResult Function(DetailItem value) detail,
    required TResult Function(ActionItem value) action,
    required TResult Function(SettingsItem value) settings,
    required TResult Function(NotFoundItem value) notFound,
  }) {
    return home(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
  }) {
    return home?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
    required TResult orElse(),
  }) {
    if (home != null) {
      return home(this);
    }
    return orElse();
  }
}

abstract class HomeItem extends NavigationItem {
  const factory HomeItem() = _$HomeItem;
  const HomeItem._() : super._();
}

/// @nodoc
abstract class $SearchResultItemCopyWith<$Res> {
  factory $SearchResultItemCopyWith(
          SearchResultItem value, $Res Function(SearchResultItem) then) =
      _$SearchResultItemCopyWithImpl<$Res>;
  $Res call({String query});
}

/// @nodoc
class _$SearchResultItemCopyWithImpl<$Res>
    extends _$NavigationItemCopyWithImpl<$Res>
    implements $SearchResultItemCopyWith<$Res> {
  _$SearchResultItemCopyWithImpl(
      SearchResultItem _value, $Res Function(SearchResultItem) _then)
      : super(_value, (v) => _then(v as SearchResultItem));

  @override
  SearchResultItem get _value => super._value as SearchResultItem;

  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(SearchResultItem(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchResultItem extends SearchResultItem {
  const _$SearchResultItem({required this.query}) : super._();

  @override
  final String query;

  @override
  String toString() {
    return 'NavigationItem.searchResult(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchResultItem &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  $SearchResultItemCopyWith<SearchResultItem> get copyWith =>
      _$SearchResultItemCopyWithImpl<SearchResultItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(String query) searchResult,
    required TResult Function(String query, String title) detail,
    required TResult Function(String query, String title) action,
    required TResult Function() settings,
    required TResult Function(String location, String message) notFound,
  }) {
    return searchResult(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
  }) {
    return searchResult?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
    required TResult orElse(),
  }) {
    if (searchResult != null) {
      return searchResult(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeItem value) home,
    required TResult Function(SearchResultItem value) searchResult,
    required TResult Function(DetailItem value) detail,
    required TResult Function(ActionItem value) action,
    required TResult Function(SettingsItem value) settings,
    required TResult Function(NotFoundItem value) notFound,
  }) {
    return searchResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
  }) {
    return searchResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
    required TResult orElse(),
  }) {
    if (searchResult != null) {
      return searchResult(this);
    }
    return orElse();
  }
}

abstract class SearchResultItem extends NavigationItem {
  const factory SearchResultItem({required String query}) = _$SearchResultItem;
  const SearchResultItem._() : super._();

  String get query;
  @JsonKey(ignore: true)
  $SearchResultItemCopyWith<SearchResultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailItemCopyWith<$Res> {
  factory $DetailItemCopyWith(
          DetailItem value, $Res Function(DetailItem) then) =
      _$DetailItemCopyWithImpl<$Res>;
  $Res call({String query, String title});
}

/// @nodoc
class _$DetailItemCopyWithImpl<$Res> extends _$NavigationItemCopyWithImpl<$Res>
    implements $DetailItemCopyWith<$Res> {
  _$DetailItemCopyWithImpl(DetailItem _value, $Res Function(DetailItem) _then)
      : super(_value, (v) => _then(v as DetailItem));

  @override
  DetailItem get _value => super._value as DetailItem;

  @override
  $Res call({
    Object? query = freezed,
    Object? title = freezed,
  }) {
    return _then(DetailItem(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DetailItem extends DetailItem {
  const _$DetailItem({required this.query, required this.title}) : super._();

  @override
  final String query;
  @override
  final String title;

  @override
  String toString() {
    return 'NavigationItem.detail(query: $query, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailItem &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, title);

  @JsonKey(ignore: true)
  @override
  $DetailItemCopyWith<DetailItem> get copyWith =>
      _$DetailItemCopyWithImpl<DetailItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(String query) searchResult,
    required TResult Function(String query, String title) detail,
    required TResult Function(String query, String title) action,
    required TResult Function() settings,
    required TResult Function(String location, String message) notFound,
  }) {
    return detail(query, title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
  }) {
    return detail?.call(query, title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(query, title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeItem value) home,
    required TResult Function(SearchResultItem value) searchResult,
    required TResult Function(DetailItem value) detail,
    required TResult Function(ActionItem value) action,
    required TResult Function(SettingsItem value) settings,
    required TResult Function(NotFoundItem value) notFound,
  }) {
    return detail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
  }) {
    return detail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
    required TResult orElse(),
  }) {
    if (detail != null) {
      return detail(this);
    }
    return orElse();
  }
}

abstract class DetailItem extends NavigationItem {
  const factory DetailItem({required String query, required String title}) =
      _$DetailItem;
  const DetailItem._() : super._();

  String get query;
  String get title;
  @JsonKey(ignore: true)
  $DetailItemCopyWith<DetailItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionItemCopyWith<$Res> {
  factory $ActionItemCopyWith(
          ActionItem value, $Res Function(ActionItem) then) =
      _$ActionItemCopyWithImpl<$Res>;
  $Res call({String query, String title});
}

/// @nodoc
class _$ActionItemCopyWithImpl<$Res> extends _$NavigationItemCopyWithImpl<$Res>
    implements $ActionItemCopyWith<$Res> {
  _$ActionItemCopyWithImpl(ActionItem _value, $Res Function(ActionItem) _then)
      : super(_value, (v) => _then(v as ActionItem));

  @override
  ActionItem get _value => super._value as ActionItem;

  @override
  $Res call({
    Object? query = freezed,
    Object? title = freezed,
  }) {
    return _then(ActionItem(
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ActionItem extends ActionItem {
  const _$ActionItem({required this.query, required this.title}) : super._();

  @override
  final String query;
  @override
  final String title;

  @override
  String toString() {
    return 'NavigationItem.action(query: $query, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ActionItem &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query, title);

  @JsonKey(ignore: true)
  @override
  $ActionItemCopyWith<ActionItem> get copyWith =>
      _$ActionItemCopyWithImpl<ActionItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(String query) searchResult,
    required TResult Function(String query, String title) detail,
    required TResult Function(String query, String title) action,
    required TResult Function() settings,
    required TResult Function(String location, String message) notFound,
  }) {
    return action(query, title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
  }) {
    return action?.call(query, title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
    required TResult orElse(),
  }) {
    if (action != null) {
      return action(query, title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeItem value) home,
    required TResult Function(SearchResultItem value) searchResult,
    required TResult Function(DetailItem value) detail,
    required TResult Function(ActionItem value) action,
    required TResult Function(SettingsItem value) settings,
    required TResult Function(NotFoundItem value) notFound,
  }) {
    return action(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
  }) {
    return action?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
    required TResult orElse(),
  }) {
    if (action != null) {
      return action(this);
    }
    return orElse();
  }
}

abstract class ActionItem extends NavigationItem {
  const factory ActionItem({required String query, required String title}) =
      _$ActionItem;
  const ActionItem._() : super._();

  String get query;
  String get title;
  @JsonKey(ignore: true)
  $ActionItemCopyWith<ActionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsItemCopyWith<$Res> {
  factory $SettingsItemCopyWith(
          SettingsItem value, $Res Function(SettingsItem) then) =
      _$SettingsItemCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsItemCopyWithImpl<$Res>
    extends _$NavigationItemCopyWithImpl<$Res>
    implements $SettingsItemCopyWith<$Res> {
  _$SettingsItemCopyWithImpl(
      SettingsItem _value, $Res Function(SettingsItem) _then)
      : super(_value, (v) => _then(v as SettingsItem));

  @override
  SettingsItem get _value => super._value as SettingsItem;
}

/// @nodoc

class _$SettingsItem extends SettingsItem {
  const _$SettingsItem() : super._();

  @override
  String toString() {
    return 'NavigationItem.settings()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingsItem);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(String query) searchResult,
    required TResult Function(String query, String title) detail,
    required TResult Function(String query, String title) action,
    required TResult Function() settings,
    required TResult Function(String location, String message) notFound,
  }) {
    return settings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
  }) {
    return settings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
    required TResult orElse(),
  }) {
    if (settings != null) {
      return settings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeItem value) home,
    required TResult Function(SearchResultItem value) searchResult,
    required TResult Function(DetailItem value) detail,
    required TResult Function(ActionItem value) action,
    required TResult Function(SettingsItem value) settings,
    required TResult Function(NotFoundItem value) notFound,
  }) {
    return settings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
  }) {
    return settings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
    required TResult orElse(),
  }) {
    if (settings != null) {
      return settings(this);
    }
    return orElse();
  }
}

abstract class SettingsItem extends NavigationItem {
  const factory SettingsItem() = _$SettingsItem;
  const SettingsItem._() : super._();
}

/// @nodoc
abstract class $NotFoundItemCopyWith<$Res> {
  factory $NotFoundItemCopyWith(
          NotFoundItem value, $Res Function(NotFoundItem) then) =
      _$NotFoundItemCopyWithImpl<$Res>;
  $Res call({String location, String message});
}

/// @nodoc
class _$NotFoundItemCopyWithImpl<$Res>
    extends _$NavigationItemCopyWithImpl<$Res>
    implements $NotFoundItemCopyWith<$Res> {
  _$NotFoundItemCopyWithImpl(
      NotFoundItem _value, $Res Function(NotFoundItem) _then)
      : super(_value, (v) => _then(v as NotFoundItem));

  @override
  NotFoundItem get _value => super._value as NotFoundItem;

  @override
  $Res call({
    Object? location = freezed,
    Object? message = freezed,
  }) {
    return _then(NotFoundItem(
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundItem extends NotFoundItem {
  const _$NotFoundItem({required this.location, this.message = "404"})
      : super._();

  @override
  final String location;
  @JsonKey(defaultValue: "404")
  @override
  final String message;

  @override
  String toString() {
    return 'NavigationItem.notFound(location: $location, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotFoundItem &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location, message);

  @JsonKey(ignore: true)
  @override
  $NotFoundItemCopyWith<NotFoundItem> get copyWith =>
      _$NotFoundItemCopyWithImpl<NotFoundItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() home,
    required TResult Function(String query) searchResult,
    required TResult Function(String query, String title) detail,
    required TResult Function(String query, String title) action,
    required TResult Function() settings,
    required TResult Function(String location, String message) notFound,
  }) {
    return notFound(location, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
  }) {
    return notFound?.call(location, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? home,
    TResult Function(String query)? searchResult,
    TResult Function(String query, String title)? detail,
    TResult Function(String query, String title)? action,
    TResult Function()? settings,
    TResult Function(String location, String message)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(location, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomeItem value) home,
    required TResult Function(SearchResultItem value) searchResult,
    required TResult Function(DetailItem value) detail,
    required TResult Function(ActionItem value) action,
    required TResult Function(SettingsItem value) settings,
    required TResult Function(NotFoundItem value) notFound,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomeItem value)? home,
    TResult Function(SearchResultItem value)? searchResult,
    TResult Function(DetailItem value)? detail,
    TResult Function(ActionItem value)? action,
    TResult Function(SettingsItem value)? settings,
    TResult Function(NotFoundItem value)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFoundItem extends NavigationItem {
  const factory NotFoundItem({required String location, String message}) =
      _$NotFoundItem;
  const NotFoundItem._() : super._();

  String get location;
  String get message;
  @JsonKey(ignore: true)
  $NotFoundItemCopyWith<NotFoundItem> get copyWith =>
      throw _privateConstructorUsedError;
}
