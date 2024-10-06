import 'package:flutter/material.dart';

extension ContextX on BuildContext {
  MediaQueryData getMediaQuery() => MediaQuery.of(this);

  Size getScreenSize() => getMediaQuery().size;

  Orientation getOrientation() => getMediaQuery().orientation;

  ThemeData getTheme() => Theme.of(this);

  ColorScheme getColorScheme() => getTheme().colorScheme;

  TextTheme getTextTheme() => getTheme().textTheme;
}
