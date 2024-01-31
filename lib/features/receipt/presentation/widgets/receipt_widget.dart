import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_event.dart';
import 'package:receipts/features/receipt/presentation/widgets/comments_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/cooking_steps_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_header_widget.dart';

@immutable
class ReceiptWidget extends StatelessWidget {
  final ReceiptEntity receipt;
  final Map<int, int> userIdFavoriteIdMap;

  const ReceiptWidget({
    super.key,
    required this.receipt,
    required this.userIdFavoriteIdMap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocProvider<HeaderBloc>(
            create: (BuildContext context) {
              final bloc = HeaderBloc();
              bloc.add(LoadHeaderEvent(
                count: userIdFavoriteIdMap.length,
                favoriteId: userIdFavoriteIdMap.containsKey(Constants.appUserId)
                    ? userIdFavoriteIdMap[Constants.appUserId]!
                    : null,
              ));
              return bloc;
            },
            child: ReceiptHeaderWidget(receipt: receipt),
          ),
          const SizedBox(height: 20),
          IngredientsWidget(receipt: receipt),
          const SizedBox(height: 20),
          CookingStepsWidget(receipt: receipt),
          const SizedBox(height: 27),
          CommentsWidget(receipt: receipt),
        ],
      ),
    );
  }
}
