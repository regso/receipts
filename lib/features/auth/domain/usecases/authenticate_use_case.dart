import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';

class AuthenticateUseCase {
  final ReceiptRepository receiptRepository;

  AuthenticateUseCase({required this.receiptRepository});

  Future<int?> call({required String login, required String password}) =>
      receiptRepository.authenticate(login, password);
}
