import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:startup_sw_dev/theme/theme.dart';

void customToast({required String message}) {
  final context = Get.context;
  if (context == null || !context.mounted) return;

  final theme = Theme.of(context);
  final isDarkMode = theme.brightness == Brightness.dark;

  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: isDarkMode ? colorSchemeDark.surface : colorSchemeLight.surface,
    textColor: isDarkMode ? lightColor : darkColor,
    fontSize: 16.0,
  );
}
