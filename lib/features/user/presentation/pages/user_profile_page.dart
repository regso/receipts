import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/user/presentation/bloc/ble_devices_bloc.dart';
import 'package:receipts/features/user/presentation/bloc/ble_devices_event.dart';
import 'package:receipts/features/user/presentation/widgets/ble_devices_widget.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BleDevicesBloc>(
      create: (BuildContext context) {
        return BleDevicesBloc()..add(const LoadBleDevicesEvent());
      },
      child: const BleDevicesWidget(),
    );
  }
}
