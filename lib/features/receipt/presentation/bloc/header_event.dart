sealed class HeaderEvent {}

class LoadHeaderEvent extends HeaderEvent {
  final int count;
  final int? favoriteId;

  LoadHeaderEvent({required this.count, required this.favoriteId});
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
