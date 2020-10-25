import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

typedef Widget ScreenBuilder<T>(T param);

enum Screen {
  notFound,
  home,
  addOrEdit,
  details,
}

class ScreenConfig<T> {
  final Screen screen;
  final String urlPattern;
  final ScreenBuilder builder;

  ScreenConfig({
    @required this.screen,
    @required this.urlPattern,
    @required this.builder,
  });
}
