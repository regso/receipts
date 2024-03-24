import 'package:receipts/features/ble/data/ble_api.g.dart';

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
  final List<BleDevice> devices;

  const LoadedBleDevicesState({
    required this.devices,
  });
}

class ErrorBleDevicesState extends BleDevicesState {
  const ErrorBleDevicesState();
}
