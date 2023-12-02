import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt_details/data/models/comment_model.dart';
import 'package:receipts/features/receipt_details/presentation/widgets/comment_widget.dart';

class CommentListWidget extends StatefulWidget {
  final List<CommentModel> commentModelList;

  const CommentListWidget({super.key, required this.commentModelList});

  @override
  State<CommentListWidget> createState() => _CommentListWidgetState();
}

class _CommentListWidgetState extends State<CommentListWidget> {
  final TextEditingController _textController = TextEditingController();
  late List<CommentModel> _commentModelList;

  @override
  void initState() {
    super.initState();
    _commentModelList = widget.commentModelList;
  }

  @override
  Widget build(BuildContext context) {
    final comments = _commentModelList.map((CommentModel model) {
      return Column(
        children: [
          CommentWidget(text: model.text),
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
          ...comments,
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
            onPressed: () {
              setState(() {
                _commentModelList.add(CommentModel(text: _textController.text));
                _textController.clear();
              });
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
