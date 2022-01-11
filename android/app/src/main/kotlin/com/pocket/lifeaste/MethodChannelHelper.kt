package com.pocket.lifeaste

import io.flutter.plugin.common.MethodChannel

const val flutter_action_native_method_channel = "FlutterActionNativeMethodChannel"
const val native_action_flutter_method_channel = "NativeActionFlutterMethodChannel"

const val native_method_GetNativeInfo = "GetNativeInfo"

object MethodChannelHelper {
    var nativeActionFlutterChannel: MethodChannel? = null
}