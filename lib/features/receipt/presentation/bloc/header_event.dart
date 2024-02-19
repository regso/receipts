sealed class HeaderEvent {}

class LoadHeaderEvent extends HeaderEvent {
  final int receiptId;

  LoadHeaderEvent({required this.receiptId});
}

class CheckHeaderEvent extends HeaderEvent {
  final int receiptId;

  CheckHeaderEvent({required this.receiptId});
}

class UncheckHeaderEvent extends HeaderEvent {
  final int receiptId;
  final int favoriteId;

  UncheckHeaderEvent({required this.receiptId, required this.favoriteId});
}
