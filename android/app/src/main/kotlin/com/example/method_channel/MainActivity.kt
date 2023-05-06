package com.example.method_channel

import android.os.Handler
import android.os.Looper
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(
            flutterEngine.dartExecutor,
            "bottom_sheet_method_channel"
        ).setMethodCallHandler { call, result ->
            if (call.method == "getData") {
                Handler(Looper.getMainLooper()).postDelayed({
                    sendDataToFlutter(result);
                }, 2000)
            }else {
                result.notImplemented();
            }
        }
    }

    private fun sendDataToFlutter(result: MethodChannel.Result) {
        // Prepare the data to send to Flutter
        val data: HashMap<String, Any> = HashMap()
        data["distance"] = "3.08 Miles"
        data["date"] = "5th May"
        data["time"] = "10:02 - 18:32 (30 Minutes)"
        data["start_point"] = "The Hil and Central"
        data["end_point"] = "Melrose & Brighton"

        // Send the data to Flutter
        result.success(data)
    }
}