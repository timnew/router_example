class RoutePathVisitor {
  final String location;
  final String seperator;

  late List<String> _parts;

  RoutePathVisitor(this.location, {this.seperator = '/'}) {
    reset();
  }

  void reset() {
    _parts = location.split(seperator);
    if (location.endsWith(seperator)) {
      _parts.removeLast();
    }
    _parts = _parts.reversed.toList(growable: false);
  }

  String badLocation() {
    _parts.clear();

    return location;
  }

  bool get hasNext => _parts.isNotEmpty;

  String get peek => _parts.last;

  String consume() => _parts.removeLast();
}
