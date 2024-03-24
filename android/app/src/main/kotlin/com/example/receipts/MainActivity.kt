package com.example.receipts

import BleApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        BleApi.setUp(flutterEngine.dartExecutor.binaryMessenger, BleApiImpl())
    }
}
