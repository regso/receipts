import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';

class CommentWidget extends StatelessWidget {
  final String text;

  const CommentWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 18),
          child: CircleAvatar(
            child: Image.asset('assets/images/user_avatar_example.png'),
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
                      'anna_obraztsova',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppTheme.receiptCommentUserNameColor,
                      ),
                    ),
                  ),
                  Text(
                    '25.05.2022',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.receiptCommentDateColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(text, style: const TextStyle(fontSize: 16)),
            ],
          ),
        )
      ],
    );
  }
}
