import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/ble/data/ble_api.g.dart';
import 'package:receipts/features/user/presentation/bloc/ble_devices_event.dart';
import 'package:receipts/features/user/presentation/bloc/ble_devices_state.dart';

class BleDevicesBloc extends Bloc<BleDevicesEvent, BleDevicesState> {
  BleDevicesBloc() : super(const InitBleDevicesState()) {
    on<LoadBleDevicesEvent>(
      (event, emit) async {
        try {
          emit(const LoadingBleDevicesState());
          BleApi bleApi = BleApi();
          final devices = await bleApi.getDevices();
          emit(
            LoadedBleDevicesState(
              devices: devices.whereType<BleDevice>().toList(),
            ),
          );
        } catch (_) {
          emit(const ErrorBleDevicesState());
        }
      },
    );
  }
}
