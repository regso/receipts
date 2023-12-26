import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipts/presentation/widgets/receipts_item_widget.dart';

class ReceiptsWidget extends StatefulWidget {
  final ReceiptRepository _receiptRepository = ReceiptRepository();

  ReceiptsWidget({super.key});

  @override
  State<ReceiptsWidget> createState() => _ReceiptsWidgetState();
}

class _ReceiptsWidgetState extends State<ReceiptsWidget> {
  late Future<List<ReceiptEntity>> _futureReceipts;

  @override
  void initState() {
    super.initState();
    _futureReceipts = widget._receiptRepository.findReceipts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureReceipts,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<ReceiptEntity> receipts = snapshot.data!;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              children: receipts
                  .map((ReceiptEntity model) =>
                      ReceiptsItemWidget(receipt: model))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
