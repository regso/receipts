sealed class ReceiptsEvent {
  const ReceiptsEvent();
}

class LoadReceiptsEvent extends ReceiptsEvent {
  final bool isFavorites;
  final int? userId;

  const LoadReceiptsEvent({this.isFavorites = false, this.userId});
}
