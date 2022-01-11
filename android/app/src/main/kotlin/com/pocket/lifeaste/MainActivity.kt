package com.pocket.lifeaste

import android.os.Bundle
import android.os.Handler
import android.provider.Settings
import android.util.Log
import androidx.ads.identifier.AdvertisingIdClient
import androidx.ads.identifier.AdvertisingIdInfo
import com.google.common.util.concurrent.FutureCallback
import com.google.common.util.concurrent.Futures.addCallback
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import java.util.concurrent.Executors
import kotlin.random.Random

class MainActivity: FlutterActivity() {
    private var resultMap: MutableMap<String, MethodChannel.Result> = mutableMapOf()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        UiThreadUtil.init(Handler())
    }

    override fun onDestroy() {
        super.onDestroy()
        UiThreadUtil.destroy();
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        MethodChannelHelper.nativeActionFlutterChannel = MethodChannel(flutterEngine.dartExecutor, native_action_flutter_method_channel)
        MethodChannel(flutterEngine.dartExecutor, flutter_action_native_method_channel).setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    native_method_GetNativeInfo -> {
                        resultMap[call.method] = result
                        determineAdvertisingInfo()
                    }
                    else -> {
                        result.notImplemented()
                    }
                }
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }

    /**
     * 本地存储广告id，写入之后不作更新
     */
    private fun determineAdvertisingInfo() {
        val methodResult = resultMap[native_method_GetNativeInfo]
        val map: MutableMap<String, String> = mutableMapOf()
        if (SpManager.adid.isNotBlank()) {
            map["uuid"] = SpManager.adid
            map["guestId"] = SpManager.adid
            Log.d("adid ", "SpManager.adid.isNotBlank()")
            methodResult?.success(map.toMap())
        } else {
            if (AdvertisingIdClient.isAdvertisingIdProviderAvailable(applicationContext)) {
                Log.d("adid ", "isAdvertisingIdProviderAvailable yes")
                val advertisingIdInfoListenableFuture =
                        AdvertisingIdClient.getAdvertisingIdInfo(applicationContext)
                addCallback(advertisingIdInfoListenableFuture,
                        object : FutureCallback<AdvertisingIdInfo> {
                            override fun onSuccess(adInfo: AdvertisingIdInfo?) {
                                val adid: String? = adInfo?.id
                                val isLimitTrackingEnabled: Boolean? = adInfo?.isLimitAdTrackingEnabled
                                if (!adid.isNullOrBlank() && !adid.contains("0000")) {
                                    if (SpManager.adid.isBlank()) {
                                        SpManager.adid = adid
                                    }
                                } else {
                                    val random: String = "LIMIT" + System.currentTimeMillis().toString() + Random.nextInt(1000000).toString()
                                    SpManager.adid = random
                                }
                                map["uuid"] = SpManager.adid
                                map["guestId"] = SpManager.adid
                                Log.d("adid ", "onSuccess adid:${SpManager.adid}， isLimitTrackingEnabled：$isLimitTrackingEnabled")
                                UiThreadUtil.run {
                                    methodResult?.success(map.toMap())
                                }
                            }

                            override fun onFailure(t: Throwable) {
                                Log.e("MY_APP_TAG",
                                        "Failed to connect to Advertising ID provider.")
                                // Try to connect to the Advertising ID provider again, or fall
                                // back to an ads solution that doesn't require using the
                                // Advertising ID library.
                                Log.d("adid ", "onFailure")
                                UiThreadUtil.run {
                                    methodResult?.success(map.toMap())
                                }
                            }
                        }, Executors.newSingleThreadExecutor())
            } else {
                // The Advertising ID client library is unavailable. Use a different
                // library to perform any required ads use cases.
                Log.d("adid ", "isAdvertisingIdProviderAvailable no")
                UiThreadUtil.run {
                    methodResult?.success(map.toMap())
                }
            }
        }
    }
}
