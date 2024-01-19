import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';

class CommentsItemWidget extends StatelessWidget {
  final CommentEntity _comment;

  const CommentsItemWidget({super.key, required CommentEntity comment})
      : _comment = comment;

  @override
  Widget build(BuildContext context) {
    final datetime = DateTime.parse(_comment.createdAt);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 18),
          child: CircleAvatar(
            backgroundColor: AppTheme.cardImageBackgroundColor,
            child: _comment.user.avatar != ''
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
                      _comment.user.login,
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
              Text(_comment.text, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              _comment.photo.isNotEmpty
                  ? Image.memory(_comment.photo)
                  : Container(),
            ],
          ),
        )
      ],
    );
  }
}
