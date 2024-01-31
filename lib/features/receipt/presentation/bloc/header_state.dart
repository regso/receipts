sealed class HeaderState {}

class InitHeaderState extends HeaderState {}

class UncheckedHeaderState extends HeaderState {
  final int count;

  UncheckedHeaderState({required this.count});
}

class CheckedHeaderState extends HeaderState {
  final int count;
  final int favoriteId;

  CheckedHeaderState({required this.count, required this.favoriteId});
}

class ErrorHeaderState extends HeaderState {}
