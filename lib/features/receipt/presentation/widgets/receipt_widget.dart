import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/presentation/widgets/comments_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/cooking_steps_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/ingredients_widget.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_header_widget.dart';

class ReceiptWidget extends StatelessWidget {
  final ReceiptEntity _receipt;
  final Future<List<ReceiptIngredientEntity>> _futureIngredients;
  final Future<List<CookingStepLinkEntity>> _futureCookingStepLinks;
  final Future<List<CommentEntity>> _futureComments;

  const ReceiptWidget({
    super.key,
    required ReceiptEntity receipt,
    required Future<List<ReceiptIngredientEntity>> futureIngredients,
    required Future<List<CookingStepLinkEntity>> futureCookingStepLinks,
    required Future<List<CommentEntity>> futureComments,
  })  : _receipt = receipt,
        _futureIngredients = futureIngredients,
        _futureCookingStepLinks = futureCookingStepLinks,
        _futureComments = futureComments;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ReceiptHeaderWidget(receipt: _receipt),
          const SizedBox(height: 20),
          IngredientsWidget(
            receipt: _receipt,
            futureIngredients: _futureIngredients,
          ),
          const SizedBox(height: 20),
          CookingStepsWidget(futureCookingStepLinks: _futureCookingStepLinks),
          const SizedBox(height: 27),
          CommentsWidget(receipt: _receipt, futureComments: _futureComments),
        ],
      ),
    );
  }
}
