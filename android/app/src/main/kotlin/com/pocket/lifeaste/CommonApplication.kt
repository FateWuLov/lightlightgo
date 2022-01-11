package com.pocket.lifeaste


import android.content.Context
import io.flutter.app.FlutterApplication

class CommonApplication : FlutterApplication() {

    companion object {
        lateinit var AppContext: Context

    }

    override fun attachBaseContext(base: Context?) {
        super.attachBaseContext(base)
        AppContext = this
    }
}
