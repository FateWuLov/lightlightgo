
import android.content.SharedPreferences
import kotlin.reflect.KProperty
import kotlin.reflect.KType

internal fun KType.isStringSet(): Boolean =
        classifier == MutableSet::class && arguments.isNotEmpty() && arguments[0].type?.classifier == String::class

interface HasSharedPreference {
    var preference: SharedPreferences
    var preferenceEditor: SharedPreferences.Editor

    fun clear() {
        preferenceEditor.clear().apply()
    }

    // getters
    fun getInt(key: String, defValue: Int = 0): Int {
        return try {
            preference.getInt(key, defValue)
        } catch (t: Throwable) {
            t.printStackTrace()
            defValue
        }
    }

    fun getString(key: String, defValue: String = ""): String = preference.getString(key, defValue)!!

    fun getStringSet(key: String, defValue: MutableSet<String> = mutableSetOf()): MutableSet<String> {
        return try {
            preference.getStringSet(key, defValue)
        } catch (t: Throwable) {
            t.printStackTrace()
            defValue
        }!!
    }

    fun getBoolean(key: String, defValue: Boolean = false): Boolean {
        return try {
            preference.getBoolean(key, defValue)
        } catch (t: Throwable) {
            t.printStackTrace()
            defValue
        }
    }

    fun getLong(key: String, defValue: Long = 0): Long {
        return try {
            preference.getLong(key, defValue)
        } catch (t: Throwable) {
            t.printStackTrace()
            defValue
        }
    }

    fun getFloat(key: String, defValue: Float = 0.0f): Float {
        return try {
            preference.getFloat(key, defValue)
        } catch (t: Throwable) {
            t.printStackTrace()
            defValue
        }
    }

    fun get(key: String, type: KType, defValue: Any? = null): Any = when {
        type.classifier == String::class -> getString(key, defValue as String? ?: "")
        type.classifier == Int::class -> getInt(key, defValue as Int? ?: 0)
        type.classifier == Boolean::class -> getBoolean(key, defValue as Boolean? ?: false)
        type.classifier == Float::class -> getFloat(key, defValue as Float? ?: 0f)
        type.classifier == Long::class -> getLong(key, defValue as Long? ?: 0L)
        type.isStringSet() -> getStringSet(key, defValue as MutableSet<String>? ?: mutableSetOf())
        else -> throw IllegalArgumentException("type should only be one of {String, Int, Boolean, Float, Long, MutableSet<String>}")
    }

    // savers
    fun set(key: String, value: Int) {
        preferenceEditor.putInt(key, value)
        preferenceEditor.commit()
    }

    fun set(key: String, value: Long) {
        preferenceEditor.putLong(key, value)
        preferenceEditor.apply()
    }

    fun set(key: String, value: Boolean) {
        preferenceEditor.putBoolean(key, value)
        preferenceEditor.apply()
    }

    fun set(key: String, value: String) {
        preferenceEditor.putString(key, value)
        preferenceEditor.apply()
    }

    fun set(key: String, value: Float) {
        preferenceEditor.putFloat(key, value)
        preferenceEditor.apply()
    }

    fun set(key: String, value: MutableSet<String>) {
        preferenceEditor.putStringSet(key, value)
        preferenceEditor.apply()
    }

    fun set(key: String, value: Any, type: KType) {
        when {
            type.classifier == Int::class -> set(key, value as Int)
            type.classifier == Long::class -> set(key, value as Long)
            type.classifier == Boolean::class -> set(key, value as Boolean)
            type.classifier == String::class -> set(key, value as String)
            type.classifier == Float::class -> set(key, value as Float)
            type.isStringSet() -> set(key, value as MutableSet<String>)
            else -> throw IllegalArgumentException("value's type should only be one of {String, Int, Boolean, Float, Long, MutableSet<String>}")
        }
    }
}

open class StringSetSPReadDelegate(val key: String,
                                   private val defValue: MutableSet<String>? = null,
                                   private val onReadValue: (thisRef: Any, value: MutableSet<String>) -> Unit = { _, _ -> }) {
    operator fun getValue(thisRef: HasSharedPreference, property: KProperty<*>): MutableSet<String> =
            internalGetValue(thisRef, property, false)

    protected fun internalGetValue(thisRef: HasSharedPreference, property: KProperty<*>, skipOnRead: Boolean = true): MutableSet<String> {
        val value = thisRef.getStringSet(key, defValue ?: mutableSetOf())
        if (!skipOnRead)
            onReadValue(thisRef, value)
        return value
    }
}

class StringSetSPReadWriteDelegate(key: String,
                                   defValue: MutableSet<String>? = null,
                                   onReadValue: (thisRef: Any, value: MutableSet<String>) -> Unit = { _, _ -> },
                                   private val onWriteValue: (thisRef: Any, old: MutableSet<String>, new: MutableSet<String>) -> Unit = { _, _, _ -> }) : StringSetSPReadDelegate(key, defValue, onReadValue) {

    operator fun setValue(thisRef: HasSharedPreference, property: KProperty<*>, value: MutableSet<String>) {
        val old = internalGetValue(thisRef, property)
        if (old == value)
            return
        thisRef.set(key, value)
        onWriteValue(thisRef, old, value)
    }
}

open class IntSPReadDelegate(val key: String,
                             private val defValue: Int? = null,
                             private val onReadValue: (thisRef: Any, value: Int) -> Unit = { _, _ -> }) {

    operator fun getValue(thisRef: HasSharedPreference, property: KProperty<*>): Int =
            internalGetValue(thisRef, property, false)

    protected fun internalGetValue(thisRef: HasSharedPreference, property: KProperty<*>, skipOnRead: Boolean = true): Int {
        val value = thisRef.getInt(key, defValue ?: 0)
        if (!skipOnRead)
            onReadValue(thisRef, value)
        return value
    }
}


class IntSPReadWriteDelegate(key: String,
                             defValue: Int? = null,
                             onReadValue: (thisRef: Any, value: Int) -> Unit = { _, _ -> },
                             private val onWriteValue: (thisRef: Any, old: Int, new: Int) -> Unit = { _, _, _ -> }) : IntSPReadDelegate(key, defValue, onReadValue) {

    operator fun setValue(thisRef: HasSharedPreference, property: KProperty<*>, value: Int) {
        val old = internalGetValue(thisRef, property)
        if (old == value)
            return
        thisRef.set(key, value)
        onWriteValue(thisRef, old, value)
    }
}

open class LongSPReadDelegate(val key: String,
                              private val defValue: Long? = null,
                              private val onReadValue: (thisRef: Any, value: Long) -> Unit = { _, _ -> }) {

    operator fun getValue(thisRef: HasSharedPreference, property: KProperty<*>): Long =
            internalGetValue(thisRef, property, false)

    protected fun internalGetValue(thisRef: HasSharedPreference, property: KProperty<*>, skipOnRead: Boolean = true): Long {
        val value = thisRef.getLong(key, defValue ?: 0L)
        if (!skipOnRead)
            onReadValue(thisRef, value)
        return value
    }
}


class LongSPReadWriteDelegate(key: String,
                              defValue: Long? = null,
                              onReadValue: (thisRef: Any, value: Long) -> Unit = { _, _ -> },
                              private val onWriteValue: (thisRef: Any, old: Long, new: Long) -> Unit = { _, _, _ -> }) : LongSPReadDelegate(key, defValue, onReadValue) {

    operator fun setValue(thisRef: HasSharedPreference, property: KProperty<*>, value: Long) {
        val old = internalGetValue(thisRef, property)
        if (old == value)
            return
        thisRef.set(key, value)
        onWriteValue(thisRef, old, value)
    }
}

open class StringSPReadDelegate(val key: String,
                                private val defValue: String? = null,
                                private val onReadValue: (thisRef: Any, value: String) -> Unit = { _, _ -> }) {

    operator fun getValue(thisRef: HasSharedPreference, property: KProperty<*>): String =
            internalGetValue(thisRef, property, false)

    protected fun internalGetValue(thisRef: HasSharedPreference, property: KProperty<*>, skipOnRead: Boolean = true): String {
        val value = thisRef.getString(key, defValue ?: "")
        if (!skipOnRead)
            onReadValue(thisRef, value)
        return value
    }
}


class StringSPReadWriteDelegate(key: String,
                                defValue: String? = null,
                                onReadValue: (thisRef: Any, value: String) -> Unit = { _, _ -> },
                                private val onWriteValue: (thisRef: Any, old: String, new: String) -> Unit = { _, _, _ -> }) : StringSPReadDelegate(key, defValue, onReadValue) {

    operator fun setValue(thisRef: HasSharedPreference, property: KProperty<*>, value: String) {
        val old = internalGetValue(thisRef, property)
        if (old == value)
            return
        thisRef.set(key, value)
        onWriteValue(thisRef, old, value)
    }
}

open class BooleanSPReadDelegate(val key: String,
                                 private val defValue: Boolean? = null,
                                 private val onReadValue: (thisRef: Any, value: Boolean) -> Unit = { _, _ -> }) {

    operator fun getValue(thisRef: HasSharedPreference, property: KProperty<*>): Boolean =
            internalGetValue(thisRef, property, false)

    protected fun internalGetValue(thisRef: HasSharedPreference, property: KProperty<*>, skipOnRead: Boolean = true): Boolean {
        val value = thisRef.getBoolean(key, defValue ?: false)
        if (!skipOnRead)
            onReadValue(thisRef, value)
        return value
    }
}


class BooleanSPReadWriteDelegate(key: String,
                                 defValue: Boolean? = null,
                                 onReadValue: (thisRef: Any, value: Boolean) -> Unit = { _, _ -> },
                                 private val onWriteValue: (thisRef: Any, old: Boolean, new: Boolean) -> Unit = { _, _, _ -> }) : BooleanSPReadDelegate(key, defValue, onReadValue) {

    operator fun setValue(thisRef: HasSharedPreference, property: KProperty<*>, value: Boolean) {
        val old = internalGetValue(thisRef, property)
        if (old == value)
            return
        thisRef.set(key, value)
        onWriteValue(thisRef, old, value)
    }
}