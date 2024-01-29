import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_bloc.dart';
import 'package:receipts/features/receipts/presentation/bloc/receipts_state.dart';
import 'package:receipts/features/receipts/presentation/widgets/receipts_item_widget.dart';

class ReceiptsWidget extends StatelessWidget {
  const ReceiptsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptsBloc, ReceiptsState>(
      builder: (BuildContext context, ReceiptsState state) {
        if (state is InitReceiptsState) {
          return const Text('Initialized.');
        }

        if (state is LoadingReceiptsState) {
          return const CircularProgressIndicator();
        }

        if (state is LoadedReceiptsState) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: state.receipts
                    .map((ReceiptEntity model) => ReceiptsItemWidget(
                          receipt: model,
                          userIdFavoriteIdMap:
                              state.favoritesMap.containsKey(model.id)
                                  ? state.favoritesMap[model.id]!
                                  : {},
                        ))
                    .toList(),
              ),
            ),
          );
        }

        return const Text('Error');
      },
    );
  }
}
