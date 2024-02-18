import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/labels.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/domain/usecases/object_detect_use_case.dart';
import 'package:receipts/features/receipt/domain/usecases/save_comment_use_case.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_event.dart';
import 'package:receipts/features/receipt/presentation/bloc/receipt_state.dart';
import 'package:receipts/features/receipt/presentation/widgets/comments_item_widget.dart';
import 'package:receipts/main.dart';

class CommentsWidget extends StatefulWidget {
  final ReceiptEntity receipt;

  const CommentsWidget({super.key, required this.receipt});

  @override
  State<CommentsWidget> createState() => _CommentsWidgetState();
}

class _CommentsWidgetState extends State<CommentsWidget> {
  final TextEditingController _textController = TextEditingController();
  Uint8List _photo = Uint8List.fromList([]);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReceiptBloc, ReceiptState>(
      builder: (BuildContext context, ReceiptState state) {
        if (state is InitReceiptState) {
          return const Text('Initialized.');
        }

        if (state is LoadingReceiptState) {
          return const CircularProgressIndicator();
        }

        if (state is LoadedReceiptState) {
          final receiptBloc = BlocProvider.of<ReceiptBloc>(context);
          final commentWidgets = state.comments
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
                Stack(
                  children: [
                    TextField(
                      controller: _textController,
                      minLines: 2,
                      maxLines: 5,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        border: const OutlineInputBorder(),
                        hintText: Labels.sendCommentHint,
                        contentPadding: const EdgeInsets.only(
                          left: 12,
                          top: 20,
                          right: 40,
                          bottom: 20,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 15,
                      right: 10,
                      child: GestureDetector(
                        onTap: _onTapCommentIcon,
                        child: const Icon(Icons.image, size: 30),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Container(
                  child: _photo.isEmpty ? Container() : Image.memory(_photo),
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    backgroundColor:
                        AppTheme.receiptDetailsButtonBackgroundColor,
                  ),
                  child: Text(
                    Labels.sendCommentButton,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppTheme.receiptDetailsButtonTextColor,
                    ),
                  ),
                  onPressed: () async {
                    await sl<SaveCommentUseCase>()(
                      text: _textController.text,
                      photo: _photo,
                      receipt: widget.receipt,
                    );
                    _textController.clear();
                    _photo = Uint8List(0);
                    receiptBloc.add(
                      ReloadReceiptCommentsEvent(receipt: widget.receipt),
                    );
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        }

        return const Text('Error');
      },
    );
  }

  Future<void> _onTapCommentIcon() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _photo = await sl<ObjectDetectUseCase>()(
        photo: await pickedFile.readAsBytes(),
      );
      setState(() {});
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
