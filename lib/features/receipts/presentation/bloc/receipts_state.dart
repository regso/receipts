import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

sealed class ReceiptsState {
  const ReceiptsState();
}

class InitReceiptsState extends ReceiptsState {
  const InitReceiptsState();
}

class LoadingReceiptsState extends ReceiptsState {
  const LoadingReceiptsState();
}

class LoadedReceiptsState extends ReceiptsState {
  final List<ReceiptEntity> receipts;
  final Map<int, Map<int, int>> favoritesMap;

  const LoadedReceiptsState({
    required this.receipts,
    required this.favoritesMap,
  });
}

class ErrorReceiptsState extends ReceiptsState {
  const ErrorReceiptsState();
}
