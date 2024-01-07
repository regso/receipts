import 'package:flutter/material.dart';
import 'package:receipts/config/app_theme.dart';
import 'package:receipts/config/route_matcher.dart';
import 'package:receipts/features/receipt/domain/entities/receipt_entity.dart';

class ReceiptsItemWidget extends StatelessWidget {
  final ReceiptEntity receipt;

  const ReceiptsItemWidget({super.key, required this.receipt});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            RouteMatcher.routeReceiptDetails,
            arguments: receipt,
          );
        },
        child: SizedBox(
          height: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Container(
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
                            const SizedBox(height: 12),
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
          ),
        ),
      );
}
