import 'package:flutter/material.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/presentation/pages/receipt_page.dart';

class ReceiptPageRoute {
  static Route createRoute({
    required ReceiptEntity receipt,
    required Map<int, int> userIdFavoriteIdMap,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ReceiptPage(
        receipt: receipt,
        userIdFavoriteIdMap: userIdFavoriteIdMap,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        animation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        if (animation.status == AnimationStatus.reverse) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        }
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }
}
