import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/features/receipt_details/data/models/comment_model.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/comment_widget.dart';

class CommentListWidget extends StatelessWidget {
  final List<CommentModel> commentModelList;

  const CommentListWidget({super.key, required this.commentModelList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: AppTheme.subTextColor,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      child: Column(
        children: commentModelList.map((CommentModel model) {
          return Column(
            children: [
              CommentWidget(text: model.text),
              const SizedBox(height: 25),
            ],
          );
        }).toList(),
      ),
    );
  }
}
