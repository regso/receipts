import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_event.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_state.dart';
import 'package:receipts/features/receipt/presentation/widgets/comments_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/cooking_steps_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_header_widget.dart';

@immutable
class ReceiptWidget extends StatelessWidget {
  const ReceiptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptBloc, ReceiptState>(
      builder: (BuildContext context, ReceiptState state) {
        if (state is InitReceiptState) {
          return const Text('Initialized.');
        }

        if (state is LoadingReceiptState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is LoadedReceiptState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                BlocProvider<HeaderBloc>(
                  create: (BuildContext context) {
                    final bloc = HeaderBloc();
                    bloc.add(LoadHeaderEvent(receiptId: state.receipt.id));
                    return bloc;
                  },
                  child: ReceiptHeaderWidget(receipt: state.receipt),
                ),
                const SizedBox(height: 20),
                IngredientsWidget(receipt: state.receipt),
                const SizedBox(height: 20),
                CookingStepsWidget(receipt: state.receipt),
                const SizedBox(height: 27),
                CommentsWidget(receipt: state.receipt),
              ],
            ),
          );
        }

        return const Text('Error.');
      },
    );
  }
}
