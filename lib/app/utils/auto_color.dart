import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startup_sw_dev/theme/theme.dart';

Color autoColor() {
  final context = Get.context;
  if (context == null || !context.mounted) return Color(0x00000000);

  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  return isDarkMode ? colorSchemeDark.surface : colorSchemeLight.surface;
}
