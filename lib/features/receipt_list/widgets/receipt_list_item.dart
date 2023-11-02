import 'package:flutter/material.dart';
import '../models/receipt_list_item_model.dart';

class ReceiptListItem extends StatelessWidget {
  final ReceiptListItemModel model;

  const ReceiptListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Color(0x19929292),
                spreadRadius: 2,
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Image(
                image: AssetImage(model.imageLocation),
                height: 136,
                width: 149,
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
                          model.title,
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
                              '${model.cookingTimeMinutes} минут',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2ECC71),
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
    );
  }

  Widget build2(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 1,
        shadowColor: const Color(0xCFF4F4F4),
        color: const Color(0xFFFFFFFF),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(model.imageLocation),
              height: 136,
              width: 149,
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
                        model.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          height: 0.95,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 16),
                          const SizedBox(width: 11),
                          Text(
                            '${model.cookingTimeMinutes} минут',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF2ECC71),
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
    );
  }
}

/*
ListTile(
          // leading: Image(image: AssetImage(model.imageLocation), height: 136, width: 149),
          leading: Container(
            width: 100, // adjust the width as per your requirement
            height: 120, // adjust the height as per your requirement
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
              // image: DecorationImage(
              //   fit: BoxFit.cover,
              //   image: Image(image: ),
              //   image: Image(image: AssetImage(model.imageLocation),
              // ),
            ),
          ),
          title: Text(model.title),
          subtitle: const Text('111'),
          contentPadding: const EdgeInsets.all(0),
          isThreeLine: true,
        ),
 */
