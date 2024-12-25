import 'package:device_info_plus/device_info_plus.dart';
import 'dart:developer' as dev;

class DeviceFeature {
  DeviceFeature._internal();

  static final DeviceFeature _singleton = DeviceFeature._internal();

  factory DeviceFeature() {
    return _singleton;
  }

  final _deviceInfoPlugin = DeviceInfoPlugin();

  AndroidDeviceInfo? _androidDeviceInfo;

  Future<void> init() async {
    try {
      _androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
    } catch (e) {
      dev.log('Error initializing device info: $e');
    }
  }

  bool isEdgeToEdgeAvailable() {
    return _androidDeviceInfo != null &&
        _androidDeviceInfo!.version.sdkInt > 28;
  }
}
