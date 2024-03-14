import 'package:flutter_blue/flutter_blue.dart';

sealed class BleDevicesState {
  const BleDevicesState();
}

class InitBleDevicesState extends BleDevicesState {
  const InitBleDevicesState();
}

class LoadingBleDevicesState extends BleDevicesState {
  const LoadingBleDevicesState();
}

class LoadedBleDevicesState extends BleDevicesState {
  final List<ScanResult> scanResults;

  const LoadedBleDevicesState({
    required this.scanResults,
  });
}

class ErrorBleDevicesState extends BleDevicesState {
  const ErrorBleDevicesState();
}
