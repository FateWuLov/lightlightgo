package com.pocket.lifeaste

import android.os.Handler

object UiThreadUtil {

    private var handler: Handler? = null;

    fun init(handler: Handler) {
        this.handler = handler;
    }

    fun destroy() {
        handler?.removeCallbacksAndMessages(null)
        handler = null;
    }

    fun run(action: (() -> Unit)?) {
        handler?.post { action?.invoke() }
    }

}