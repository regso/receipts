import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

sealed class ReceiptEvent {
  const ReceiptEvent();
}

class LoadReceiptEvent extends ReceiptEvent {
  final ReceiptEntity receipt;

  const LoadReceiptEvent({required this.receipt});
}

class ReloadReceiptCommentsEvent extends ReceiptEvent {
  final ReceiptEntity receipt;

  const ReloadReceiptCommentsEvent({required this.receipt});
}
