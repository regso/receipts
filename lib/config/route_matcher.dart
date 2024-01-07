import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/presentation/pages/receipt_page.dart';
import 'package:receipts/features/receipts/presentation/pages/receipts_page.dart';

class RouteMatcher {
  static const String routeReceipts = '/receipts';
  static const String routeReceiptDetails = '/receipt_details';

  static Map<String, Widget Function(BuildContext)> getRoutesMap() {
    return {
      RouteMatcher.routeReceipts: (context) => const ReceiptsPage(),
      RouteMatcher.routeReceiptDetails: (context) {
        RouteSettings routeSettings = ModalRoute.of(context)!.settings;
        final receipt = routeSettings.arguments as ReceiptEntity;
        return ReceiptPage(receipt: receipt);
      }
    };
  }
}
