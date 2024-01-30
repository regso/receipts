import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/constants.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_bloc.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_event.dart';
import 'package:receipts/features/receipt/presentation/bloc/header_state.dart';
import 'package:receipts/features/receipts/presentation/widgets/favorite_icon_widget.dart';
import 'package:rive/rive.dart';

class ReceiptHeaderWidget extends StatefulWidget {
  final ReceiptEntity receipt;

  const ReceiptHeaderWidget({
    super.key,
    required this.receipt,
  });

  @override
  State<ReceiptHeaderWidget> createState() => _ReceiptHeaderWidgetState();
}

class _ReceiptHeaderWidgetState extends State<ReceiptHeaderWidget> {
  SMIBool? _liked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeaderBloc, HeaderState>(
      builder: (BuildContext context, HeaderState state) {
        final headerBloc = BlocProvider.of<HeaderBloc>(context);
        int count = 0;
        if (state is CheckedHeaderState) {
          _liked!.value = true;
          count = state.count;
        }
        if (state is UncheckedHeaderState) {
          _liked!.value = false;
          count = state.count;
        }

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.receipt.title,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (state is CheckedHeaderState) {
                        _liked!.value = false;
                        headerBloc.add(
                          UncheckHeaderEvent(
                            receiptId: widget.receipt.id,
                            favoriteId: state.favoriteId,
                          ),
                        );
                      } else if (state is UncheckedHeaderState) {
                        _liked!.value = true;
                        headerBloc.add(
                          CheckHeaderEvent(receiptId: widget.receipt.id),
                        );
                      }
                    },
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: RiveAnimation.asset(
                        Constants.appIconLikeButtonRive,
                        onInit: (Artboard artboard) {
                          final controller =
                              StateMachineController.fromArtboard(
                            artboard,
                            'stateMachine',
                          );
                          artboard.addController(controller!);
                          _liked =
                              controller.findInput<bool>('checked') as SMIBool;
                          _liked!.value = false;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 11),
                  Text(
                    widget.receipt.getCookingTime(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppTheme.cardSubTitleColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 220.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: widget.receipt.photoUrl != ''
                          ? Image.network(
                              widget.receipt.photoUrl,
                              fit: BoxFit.cover,
                            )
                          : ColoredBox(
                              color: AppTheme.cardImageBackgroundColor),
                    ),
                  ),
                  if (count > 0)
                    Positioned(
                      right: 0,
                      bottom: 15,
                      child: FavoriteIconWidget(
                        count: count,
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
