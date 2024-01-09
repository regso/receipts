import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/data/repositories/receipt_repository.dart';
import 'package:receipts/features/receipt/domain/entities/comment_entity.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/usecases/save_comment_use_case.dart';
import 'package:receipts/features/receipt/presentation/widgets/comments_item_widget.dart';

class CommentsWidget extends StatefulWidget {
  final ReceiptEntity _receipt;
  final Future<List<CommentEntity>> _futureComments;

  const CommentsWidget({
    super.key,
    required ReceiptEntity receipt,
    required Future<List<CommentEntity>> futureComments,
  })  : _receipt = receipt,
        _futureComments = futureComments;

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  final ReceiptRepository _receiptRepository = ReceiptRepository();
  final TextEditingController _textController = TextEditingController();
  final SaveCommentUseCase _saveCommentUseCase = SaveCommentUseCase();
  late Future<List<CommentEntity>> _futureComments = widget._futureComments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureComments,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        List<CommentEntity> comments = snapshot.data!;
        final commentWidgets = comments
            .map(
              (entity) => Column(
                children: [
                  CommentsItemWidget(comment: entity),
                  const SizedBox(height: 25),
                ],
              ),
            )
            .toList();

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
              ),
              const SizedBox(height: 15),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
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
                  await _saveCommentUseCase(
                    text: _textController.text,
                    receipt: widget._receipt,
                  );
                  _textController.clear();
                  _futureComments =
                      _receiptRepository.findCommentsByReceipt(widget._receipt);
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
