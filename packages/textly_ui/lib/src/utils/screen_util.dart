// ignore_for_file: public_member_api_docs

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

abstract class ScreenUtil {
  ScreenUtil._();

  /// Get screen logical size representation
  ///
  /// extra small - ~320..599 dp, 4 column (phone)
  /// small - 600..1023 dp, 8 column (tablet)
  /// medium - 1024..1439 dp, 12 column (large tablet)
  /// large - 1440..1919 dp, 12 column
  /// extra large - 1920+ dp, 12 column
  ///
  /// [Breakpoints](https://material.io/design/layout/responsive-layout-grid.html#breakpoints)
  ///
  static ScreenSize screenSize() {
    final window = ui.window;
    final size = window.physicalSize ~/ window.devicePixelRatio;
    return _screenSizeFromSize(size);
  }

  /// Get current screen logical size representation
  ///
  /// extra small - ~320..599 dp, 4 column (phone)
  /// small - 600..1023 dp, 8 column (tablet)
  /// medium - 1024..1439 dp, 12 column (large tablet)
  /// large - 1440..1919 dp, 12 column
  /// extra large - 1920+ dp, 12 column
  ///
  /// [Breakpoints](https://material.io/design/layout/responsive-layout-grid.html#breakpoints)
  ///
  static ScreenSize screenSizeOf(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _screenSizeFromSize(size);
  }

  static ScreenSize _screenSizeFromSize(Size size) {
    if (size.width <= ScreenSize.extraSmall.max) {
      return ScreenSize.extraSmall;
    } else if (size.width <= ScreenSize.small.max) {
      return ScreenSize.small;
    } else if (size.width <= ScreenSize.medium.max) {
      return ScreenSize.medium;
    } else if (size.width <= ScreenSize.large.max) {
      return ScreenSize.large;
    } else {
      return ScreenSize.extraLarge;
    }
  }

  /// Расположение экрана
  ///
  /// portrait - портретное
  /// landscape - альбомное
  ///
  static Orientation orientation() {
    final size = ui.window.physicalSize;
    return size.height > size.width
        ? Orientation.portrait
        : Orientation.landscape;
  }
}

@immutable
class ScreenSize {
  const ScreenSize._(
    this.representation,
    this.min,
    this.max,
  );
  final num min;
  final num max;
  final String representation;

  static const ScreenSize extraSmall = ScreenSize._('xsmall', 0, 599);
  static const ScreenSize small = ScreenSize._('small', 600, 1023);
  static const ScreenSize medium = ScreenSize._('medium', 1024, 1439);
  static const ScreenSize large = ScreenSize._('large', 1440, 1919);
  static const ScreenSize extraLarge =
      ScreenSize._('xlarge', 1920, double.infinity);

  @override
  String toString() => '<ScreenSize $representation $min..$max>';

  // ignore: long-parameter-list
  ScreenSizeWhenResult when<ScreenSizeWhenResult extends Object?>({
    required ScreenSizeWhenResult Function() extraSmall,
    required ScreenSizeWhenResult Function() small,
    required ScreenSizeWhenResult Function() medium,
    required ScreenSizeWhenResult Function() large,
    required ScreenSizeWhenResult Function() extraLarge,
  }) {
    switch (representation) {
      case 'xsmall':
        return extraSmall();
      case 'small':
        return small();
      case 'medium':
        return medium();
      case 'large':
        return large();
      case 'xlarge':
      default:
        return extraLarge();
    }
  }

  /// The [maybeWhen] method is equivalent to [when],
  /// but doesn't require all callbacks to be specified.
  ///
  /// On the other hand, it adds an extra [orElse] required parameter,
  /// for fallback behavior.
  ///
  //ignore: long-parameter-list
  ScreenSizeWhenResult maybeWhen<ScreenSizeWhenResult extends Object?>({
    required ScreenSizeWhenResult Function() orElse,
    ScreenSizeWhenResult Function()? extraSmall,
    ScreenSizeWhenResult Function()? small,
    ScreenSizeWhenResult Function()? medium,
    ScreenSizeWhenResult Function()? large,
    ScreenSizeWhenResult Function()? extraLarge,
  }) =>
      when<ScreenSizeWhenResult>(
        extraSmall: extraSmall ?? orElse,
        small: small ?? orElse,
        medium: medium ?? orElse,
        large: large ?? orElse,
        extraLarge: extraLarge ?? orElse,
      );

  @override
  int get hashCode => representation.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      (other is ScreenSize && representation == other.representation);
}
