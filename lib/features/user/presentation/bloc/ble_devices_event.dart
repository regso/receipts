import 'package:flutter_blue/flutter_blue.dart';

sealed class BleDevicesEvent {
  const BleDevicesEvent();
}

class LoadBleDevicesEvent extends BleDevicesEvent {
  const LoadBleDevicesEvent();
}

class OnDataBleDevicesEvent extends BleDevicesEvent {
  final List<ScanResult> scanResults;

  const OnDataBleDevicesEvent({required this.scanResults});
}
