import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

sealed class ReceiptEvent {}

class LoadReceiptEvent extends ReceiptEvent {
  final ReceiptEntity receipt;

  LoadReceiptEvent({required this.receipt});
}

class ReloadReceiptCommentsEvent extends ReceiptEvent {
  final ReceiptEntity receipt;

  ReloadReceiptCommentsEvent({required this.receipt});
}
