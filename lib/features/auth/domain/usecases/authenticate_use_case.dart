import 'package:receipts/features/receipt/domain/repositories/abstract_receipt_repository.dart';

class AuthenticateUseCase {
  final AbstractReceiptRepository receiptRepository;

  AuthenticateUseCase({required this.receiptRepository});

  Future<int?> call({required String login, required String password}) =>
      receiptRepository.authenticate(login, password);
}
