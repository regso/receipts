import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/features/app/presentation/widgets/navigation_bar_widget.dart';
import 'package:receipts/features/user/presentation/bloc/ble_devices_bloc.dart';
import 'package:receipts/features/user/presentation/bloc/ble_devices_event.dart';
import 'package:receipts/features/user/presentation/bloc/ble_devices_state.dart';

class BleDevicesWidget extends StatelessWidget {
  const BleDevicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: SafeArea(
          child: BlocBuilder<BleDevicesBloc, BleDevicesState>(
            builder: (BuildContext context, BleDevicesState state) {
              if (state is LoadingBleDevicesState) {
                const Center(child: CircularProgressIndicator());
              }

              if (state is LoadedBleDevicesState) {
                return ListView.builder(
                  itemCount: state.scanResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        state.scanResults[index].device.type.toString(),
                      ),
                      subtitle: Text(
                        state.scanResults[index].device.id.toString(),
                      ),
                    );
                  },
                );
              }

              if (state is ErrorBleDevicesState) {
                return const Center(child: Text('Error load BLE devices.'));
              }

              return Container();
            },
          ),
        ),
        bottomNavigationBar: const NavigationBarWidget(
          currentPageSlug: AppPageSlug.userProfile,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () =>
              context.read<BleDevicesBloc>().add(const LoadBleDevicesEvent()),
        ),
      ),
    );
  }
}
