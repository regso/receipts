import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/models/comment_model.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/presentation/widgets/comments_item_widget.dart';

class CommentsWidget extends StatefulWidget {
  final ReceiptEntity receipt;

  const CommentsWidget({super.key, required this.receipt});

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  final ReceiptRepository receiptRepository = ReceiptRepository();
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CommentEntity>>(
      future: receiptRepository.findCommentsByReceipt(widget.receipt),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          throw Exception('Error');
        }

        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        List<CommentModel> comments = snapshot.data;
        final commentWidgets = comments.map((CommentModel model) {
          return Column(
            children: [
              CommentsItemWidget(comment: model),
              const SizedBox(height: 25),
            ],
          );
        }).toList();

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
            children: [
              ...commentWidgets,
              TextField(
                controller: _textController,
                minLines: 2,
                maxLines: 5,
                // keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  border: const OutlineInputBorder(),
                  // labelText:
                  hintText: Labels.sendCommentHint,
                ),
                onSubmitted: (value) {},
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  backgroundColor: AppTheme.receiptDetailsButtonBackgroundColor,
                ),
                child: Text(
                  Labels.sendCommentButton,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppTheme.receiptDetailsButtonTextColor,
                  ),
                ),
                onPressed: () async {
                  final user =
                      await receiptRepository.getUserById(Constants.appUserId);
                  final comment = CommentModel(
                    id: 0,
                    text: _textController.text,
                    photo: '',
                    createdAt: '',
                    user: user,
                    receipt: widget.receipt,
                  );
                  await receiptRepository.saveComment(comment);
                  _textController.clear();
                  setState(() {});
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
