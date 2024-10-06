import 'package:flutter/material.dart';
import 'package:map_assignment/src/core/core.dart';

const double kSectionBarWidth = 200;

/// The height of the content of [TemplateSectionField] during making dto
/// process.
///
/// As this is the most effective height for [SPMDGTextField] to display all
/// of its view correctly, then use it for remain content.
const double kContentSectionFieldHeight = 60;

/// The height of the content of [TemplateSectionField] when read in dto
/// history item.
const double kContentSectionFieldReadOnlyHeight = 40;

/// Constants [Radius]
const Radius kRadius4 = Radius.circular(4);
const Radius kRadius5 = Radius.circular(5);
const Radius kRadius8 = Radius.circular(8);
const Radius kRadius12 = Radius.circular(12);
const Radius kRadius16 = Radius.circular(16);
const Radius kRadius20 = Radius.circular(20);
const Radius kRadius24 = Radius.circular(24);
const Radius kRadius28 = Radius.circular(28);
const Radius kRadius32 = Radius.circular(32);
const Radius kRadius36 = Radius.circular(36);
const Radius kRadius40 = Radius.circular(40);
const Radius kRadius44 = Radius.circular(44);
const Radius kRadius48 = Radius.circular(48);
const Radius kRadius52 = Radius.circular(52);

/// Constants [BorderRadius].
const BorderRadius kBorderRadius4 = BorderRadius.all(kRadius4);
const BorderRadius kBorderRadius5 = BorderRadius.all(kRadius5);
const BorderRadius kBorderRadius8 = BorderRadius.all(kRadius8);
const BorderRadius kBorderRadius12 = BorderRadius.all(kRadius12);
const BorderRadius kBorderRadius16 = BorderRadius.all(kRadius16);
const BorderRadius kBorderRadius20 = BorderRadius.all(kRadius20);
const BorderRadius kBorderRadius24 = BorderRadius.all(kRadius24);
const BorderRadius kBorderRadius28 = BorderRadius.all(kRadius28);
const BorderRadius kBorderRadius32 = BorderRadius.all(kRadius32);
const BorderRadius kBorderRadius36 = BorderRadius.all(kRadius36);
const BorderRadius kBorderRadius40 = BorderRadius.all(kRadius40);
const BorderRadius kBorderRadius44 = BorderRadius.all(kRadius44);
const BorderRadius kBorderRadius48 = BorderRadius.all(kRadius48);
const BorderRadius kBorderRadius52 = BorderRadius.all(kRadius52);

/// Constants [EdgeInsets.all]
const EdgeInsets kPadding2 = EdgeInsets.all(2);
const EdgeInsets kPadding4 = EdgeInsets.all(4);
const EdgeInsets kPadding8 = EdgeInsets.all(8);
const EdgeInsets kPadding12 = EdgeInsets.all(12);
const EdgeInsets kPadding16 = EdgeInsets.all(16);
const EdgeInsets kPadding20 = EdgeInsets.all(20);
const EdgeInsets kPadding24 = EdgeInsets.all(24);
const EdgeInsets kPadding28 = EdgeInsets.all(28);
const EdgeInsets kPadding32 = EdgeInsets.all(32);

/// Constants [EdgeInsets] in horizontal.
///
/// ```dart
/// Padding(
///   padding: kPaddingHorizontal16 + kPaddingVertical8,
///   child: Container(),
/// )
/// ```
const EdgeInsets kPaddingHorizontal2 = EdgeInsets.symmetric(horizontal: 2);
const EdgeInsets kPaddingHorizontal4 = EdgeInsets.symmetric(horizontal: 4);
const EdgeInsets kPaddingHorizontal8 = EdgeInsets.symmetric(horizontal: 8);
const EdgeInsets kPaddingHorizontal12 = EdgeInsets.symmetric(horizontal: 12);
const EdgeInsets kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
const EdgeInsets kPaddingHorizontal20 = EdgeInsets.symmetric(horizontal: 20);
const EdgeInsets kPaddingHorizontal24 = EdgeInsets.symmetric(horizontal: 24);
const EdgeInsets kPaddingHorizontal28 = EdgeInsets.symmetric(horizontal: 28);
const EdgeInsets kPaddingHorizontal32 = EdgeInsets.symmetric(horizontal: 32);

/// Constants [EdgeInsets] in vertical.
const EdgeInsets kPaddingVertical2 = EdgeInsets.symmetric(vertical: 2);
const EdgeInsets kPaddingVertical4 = EdgeInsets.symmetric(vertical: 4);
const EdgeInsets kPaddingVertical8 = EdgeInsets.symmetric(vertical: 8);
const EdgeInsets kPaddingVertical12 = EdgeInsets.symmetric(vertical: 12);
const EdgeInsets kPaddingVertical16 = EdgeInsets.symmetric(vertical: 16);
const EdgeInsets kPaddingVertical20 = EdgeInsets.symmetric(vertical: 20);
const EdgeInsets kPaddingVertical24 = EdgeInsets.symmetric(vertical: 24);
const EdgeInsets kPaddingVertical28 = EdgeInsets.symmetric(vertical: 28);
const EdgeInsets kPaddingVertical32 = EdgeInsets.symmetric(vertical: 32);
const EdgeInsets kPaddingVertical64 = EdgeInsets.symmetric(vertical: 64);

/// Constants [SizedBox]
///
/// Define the space between Widget.
/// In Vertical and Horizontal.
const SizedBox kSpaceVertical2 = SizedBox(height: 2);
const SizedBox kSpaceVertical4 = SizedBox(height: 4);
const SizedBox kSpaceVertical8 = SizedBox(height: 8);
const SizedBox kSpaceVertical10 = SizedBox(height: 10);
const SizedBox kSpaceVertical12 = SizedBox(height: 12);
const SizedBox kSpaceVertical16 = SizedBox(height: 16);
const SizedBox kSpaceVertical20 = SizedBox(height: 20);
const SizedBox kSpaceVertical24 = SizedBox(height: 24);
const SizedBox kSpaceVertical32 = SizedBox(height: 32);
const SizedBox kSpaceVertical64 = SizedBox(height: 64);

const SizedBox kSpaceHorizontal2 = SizedBox(width: 2);
const SizedBox kSpaceHorizontal4 = SizedBox(width: 4);
const SizedBox kSpaceHorizontal8 = SizedBox(width: 8);
const SizedBox kSpaceHorizontal12 = SizedBox(width: 12);
const SizedBox kSpaceHorizontal16 = SizedBox(width: 16);
const SizedBox kSpaceHorizontal20 = SizedBox(width: 20);
const SizedBox kSpaceHorizontal24 = SizedBox(width: 24);
const SizedBox kSpaceHorizontal28 = SizedBox(width: 28);
const SizedBox kSpaceHorizontal32 = SizedBox(width: 32);

/// Constants [ShapeBorder]
const ShapeBorder kRoundedRectangleBorder28 = RoundedRectangleBorder(
  borderRadius: kBorderRadius28,
);

/// Constants [BorderRadiusGeometry]
const BorderRadiusGeometry kBorderRadiusGeometry20 = BorderRadius.only(
  topLeft: Radius.circular(20.0),
  topRight: Radius.circular(20.0),
);

/// Keyboard padding
EdgeInsets getKeyboardBottomPadding(BuildContext context) {
  return EdgeInsets.only(bottom: context.getMediaQuery().viewInsets.bottom);
}
