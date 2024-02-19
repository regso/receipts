import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

sealed class ReceiptEvent {
  const ReceiptEvent();
}

class LoadReceiptEvent extends ReceiptEvent {
  final int receiptId;

  const LoadReceiptEvent({required this.receiptId});
}

class ReloadReceiptCommentsEvent extends ReceiptEvent {
  final ReceiptEntity receipt;

  const ReloadReceiptCommentsEvent({required this.receipt});
}
