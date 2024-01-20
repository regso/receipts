import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/cooking_step_link_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_ingredient_entity.dart';
import 'package:receipts/features/receipt/presentation/widgets/receipt_widget.dart';

class ReceiptPage extends StatefulWidget {
  final ReceiptRepository _receiptRepository = ReceiptRepository();
  final ReceiptEntity _receipt;

  ReceiptPage({super.key, required ReceiptEntity receipt}) : _receipt = receipt;

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  late Future<List<ReceiptIngredientEntity>> _futureIngredients;
  late Future<List<CookingStepLinkEntity>> _futureCookingStepLinks;
  late Future<List<CommentEntity>> _futureComments;

  @override
  void initState() {
    super.initState();
    _futureIngredients = widget._receiptRepository
        .findReceiptIngredientsByReceipt(widget._receipt);
    _futureCookingStepLinks = widget._receiptRepository
        .findCookingStepLinksByReceipt(widget._receipt);
    _futureComments = widget._receiptRepository.findCommentsByReceipt(
      widget._receipt,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.receiptDetailsBackgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppTheme.receiptDetailsAppBarShadowColor,
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: AppBar(
            title: Text(Labels.receipt),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppTheme.receiptDetailsBackgroundColor,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(Constants.appIconHornPath),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ReceiptWidget(
          receipt: widget._receipt,
          futureIngredients: _futureIngredients,
          futureCookingStepLinks: _futureCookingStepLinks,
          futureComments: _futureComments,
        ),
      ),
    );
  }
}
