import 'dart:math';

import 'package:flutter/material.dart';
import 'package:textly/src/common/consts/emoji_and_colors.dart';

Color generateRandomColor() =>
    backgroundColors[Random().nextInt(backgroundColors.length)];
String generateRandomEmoji() => emojis[Random().nextInt(emojis.length)];
