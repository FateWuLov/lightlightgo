package com.pocket.lifeaste

import HasSharedPreference
import StringSPReadWriteDelegate
import android.content.Context
import android.content.SharedPreferences

object SpManager : HasSharedPreference {
    override var preference: SharedPreferences = CommonApplication.AppContext.getSharedPreferences("com.auracle.sharePref", Context.MODE_PRIVATE)
    override var preferenceEditor: SharedPreferences.Editor = preference.edit()
}

var SpManager.adid: String by StringSPReadWriteDelegate("adid", "")