import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';

class AuthenticateUseCase {
  // TODO: DI
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  Future<int?> call({required String login, required String password}) =>
      _receiptRepository.authenticate(login, password);
}
