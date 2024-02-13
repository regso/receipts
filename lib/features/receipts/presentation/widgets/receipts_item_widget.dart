import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipts/config/app_theme.dart';
// import 'package:receipts/config/routes/receipt_page_route.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';
// import 'package:receipts/features/receipts/presentation/bloc/receipts_bloc.dart';
// import 'package:receipts/features/receipts/presentation/bloc/receipts_event.dart';
import 'package:receipts/features/receipts/presentation/widgets/favorite_icon_widget.dart';

class ReceiptsItemWidget extends StatelessWidget {
  final ReceiptEntity receipt;
  final Map<int, int> userIdFavoriteIdMap;

  const ReceiptsItemWidget({
    super.key,
    required this.receipt,
    required this.userIdFavoriteIdMap,
  });

  @override
  Widget build(BuildContext context) {
    // final receiptsBloc = BlocProvider.of<ReceiptsBloc>(context);
    return GestureDetector(
      onTap: () {
        // TODO: need router
        // Navigator.of(context)
        //     .push(
        //   ReceiptPageRoute.createRoute(
        //     receipt: receipt,
        //     userIdFavoriteIdMap: userIdFavoriteIdMap,
        //   ),
        // )
        //     .whenComplete(() {
        //   receiptsBloc.add(const LoadReceiptsEvent());
        // });
      },
      child: SizedBox(
        height: 160,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.cardBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.cardShadowColor,
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                      child: receipt.photoUrl != ''
                          ? Image.network(
                              receipt.photoUrl,
                              height: 136,
                              width: 149,
                              fit: BoxFit.cover,
                            )
                          : Container(
                              height: 136,
                              width: 149,
                              color: AppTheme.cardImageBackgroundColor,
                            ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 30, 23, 23),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                receipt.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Icon(Icons.access_time, size: 16),
                                  const SizedBox(width: 11),
                                  Text(
                                    receipt.getCookingTime(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppTheme.cardSubTitleColor,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (userIdFavoriteIdMap.isNotEmpty)
                Positioned(
                  right: 0,
                  bottom: 25,
                  child: FavoriteIconWidget(
                    count: userIdFavoriteIdMap.length,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
