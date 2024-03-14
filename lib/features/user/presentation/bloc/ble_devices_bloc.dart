import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:receipts/features/user/presentation/bloc/ble_devices_event.dart';
import 'package:receipts/features/user/presentation/bloc/ble_devices_state.dart';

class BleDevicesBloc extends Bloc<BleDevicesEvent, BleDevicesState> {
  BleDevicesBloc() : super(const InitBleDevicesState()) {
    final flutterBlue = FlutterBlue.instance;

    on<LoadBleDevicesEvent>(
      (event, emit) async {
        try {
          emit(const LoadingBleDevicesState());
          flutterBlue.startScan(timeout: const Duration(seconds: 6));
          await emit.onEach<List<ScanResult>>(
            flutterBlue.scanResults,
            onData: (List<ScanResult> scanResults) => add(
              OnDataBleDevicesEvent(scanResults: scanResults),
            ),
          );
        } catch (_) {
          emit(const ErrorBleDevicesState());
        }
      },
    );

    on<OnDataBleDevicesEvent>(
      (event, emit) => emit(
        LoadedBleDevicesState(scanResults: event.scanResults),
      ),
    );
  }
}
