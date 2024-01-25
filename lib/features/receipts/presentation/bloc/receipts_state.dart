import 'package:flutter/widgets.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

@immutable
class ReceiptsState{
  final List<ReceiptEntity> receipts;

  const ReceiptsState(this.receipts);
}