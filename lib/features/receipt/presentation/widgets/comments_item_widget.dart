import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';

class CommentsItemWidget extends StatelessWidget {
  final CommentModel comment;

  const CommentsItemWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final datetime = DateTime.parse(comment.createdAt);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 18),
          child: CircleAvatar(
            backgroundColor: AppTheme.cardImageBackgroundColor,
            child: comment.user.avatar != ''
                ? Image.asset(Constants.appIconAvatarPath)
                : Container(),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      comment.user.login,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.receiptCommentUserNameColor,
                      ),
                    ),
                  ),
                  Text(
                    DateFormat('dd.MM.yyyy').format(datetime),
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.receiptCommentDateColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(comment.text, style: const TextStyle(fontSize: 16)),
            ],
          ),
        )
      ],
    );
  }
}
