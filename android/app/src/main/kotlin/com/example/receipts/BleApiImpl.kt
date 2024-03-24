package com.example.receipts

import BleApi
import BleDevice

class BleApiImpl : BleApi {
    override fun getHostLanguage(): String {
        return "Kotlin"
    }

    override fun getDevices(callback: (Result<List<BleDevice>>) -> Unit) {
        return callback(
            Result.success(
                listOf(
                    BleDevice(
                        name = "Device #1"
                    )
                )
            )
        )
    }
}