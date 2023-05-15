package com.example.method_channel.main

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import com.example.method_channel.data.DiaryCard
import com.google.gson.Gson
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject

class MainActivity : FlutterActivity(), KoinComponent {

    private val mainViewModel: MainViewModel by inject()
    private val METHOD_CHANNEL_STRING = "flutter_method_channel"

    private var diaryList = mutableListOf<DiaryCard>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setUpViewModel()

    }

    private fun setUpViewModel(){
        mainViewModel.diaryDetails.observe(this) { diaryDetails ->
            diaryList.addAll(diaryDetails)
        }

    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor,
            METHOD_CHANNEL_STRING
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getTravelDetails" -> {
                    Handler(Looper.getMainLooper()).postDelayed({
                        sendDataToFlutter(result)
                    }, 1000)
                }
                "getDiaryDetails" -> {
                    receiveDairyDetails(result)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun sendDataToFlutter(result: MethodChannel.Result) {
        result.success(mainViewModel.getLocationDetails())
    }

    private fun receiveDairyDetails(result: MethodChannel.Result) {

        val gson = Gson()
        val jsonString = gson.toJson(diaryList)

        jsonString?.let {
            Log.d("json ", jsonString)
            result.success(jsonString)
        } ?: result.error("JSON Encoding Error", "Failed to encode DiaryCard data to JSON", null)
    }
}