import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';

sealed class ReceiptState {}

class InitReceiptState extends ReceiptState {}

class LoadingReceiptState extends ReceiptState {}

class LoadedReceiptState extends ReceiptState {
  final ReceiptEntity receipt;

  final List<ReceiptIngredientEntity> receiptIngredients;
  final List<CookingStepLinkEntity> cookingStepLinks;
  final List<CommentEntity> comments;

  LoadedReceiptState({
    required this.receipt,
    required this.receiptIngredients,
    required this.cookingStepLinks,
    required this.comments,
  });
}

class ErrorReceiptState extends ReceiptState {}
