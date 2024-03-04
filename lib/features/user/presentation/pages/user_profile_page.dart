import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/routes/app_page.dart';
import 'package:receipts/features/app/presentation/bloc/app_bloc.dart';
import 'package:receipts/features/app/presentation/bloc/app_state.dart';
import 'package:receipts/features/app/presentation/widgets/navigation_bar_widget.dart';

class UserProfilePage extends StatelessWidget {
  final FlutterBlue _flutterBlue = FlutterBlue.instance;

  UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (BuildContext context, AppState state) {
        return Scaffold(
          backgroundColor: AppTheme.backgroundColor,
          body: SafeArea(
            child: StreamBuilder<List<ScanResult>>(
              stream: _flutterBlue.scanResults,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final scanResults = snapshot.data;
                  if (scanResults != null) {
                    ListView.builder(
                      itemCount: scanResults.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            scanResults[index].device.type.toString(),
                          ),
                          subtitle: Text(
                            scanResults[index].device.id.toString(),
                          ),
                        );
                      },
                    );
                  }
                } else if (snapshot.hasError) {
                  return const Text('Error');
                }

                return Container();
              },
            ),
          ),
          bottomNavigationBar: NavigationBarWidget(
            currentPageSlug: AppPageSlug.userProfile,
            appState: state,
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              _flutterBlue.startScan(timeout: const Duration(seconds: 6));
            },
          ),
        );
      },
    );
  }
}
