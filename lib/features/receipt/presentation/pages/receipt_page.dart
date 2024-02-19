import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_event.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_widget.dart';

@immutable
class ReceiptPage extends StatelessWidget {
  final int receiptId;

  const ReceiptPage({
    super.key,
    required this.receiptId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.receiptDetailsBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppTheme.receiptDetailsAppBarShadowColor,
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: AppBar(
            title: Text(Labels.receipt),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppTheme.receiptDetailsBackgroundColor,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(Constants.appIconHornPath),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: BlocProvider<ReceiptBloc>(
          create: (BuildContext context) {
            final bloc = ReceiptBloc();
            bloc.add(LoadReceiptEvent(receiptId: receiptId));
            return bloc;
          },
          child: const ReceiptWidget(),
        ),
      ),
    );
  }
}
