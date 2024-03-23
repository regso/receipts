import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/features/ble/data/ble_api.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/app/src/main/kotlin/com/example/receipts/BleApi.g.kt',
  kotlinOptions: KotlinOptions(),
  swiftOut: 'ios/Runner/BleApi.g.swift',
  swiftOptions: SwiftOptions(),
  dartPackageName: 'pigeon_receipts_package',
))
class BleDevice {
  String name;

  BleDevice({required this.name});
}

@HostApi()
abstract class BleApi {
  String getHostLanguage();

  @async
  List<BleDevice> getDevices();
}
