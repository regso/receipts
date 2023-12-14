import 'package:flutter/material.dart';
import 'package:receipts/config/init.dart';
import 'package:receipts/config/receipts_app.dart';

void main() async {
  await initApp();
  runApp(const ReceiptsApp());
}
