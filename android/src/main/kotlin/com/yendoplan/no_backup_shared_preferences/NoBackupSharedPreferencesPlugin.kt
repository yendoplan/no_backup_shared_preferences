package com.yendoplan.no_backup_shared_preferences

import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class NoBackupSharedPreferencesPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private var context: Context? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "no_backup_shared_preferences")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val prefs = context?.getSharedPreferences("no_backup", Context.MODE_PRIVATE)
        if (prefs == null) {
            result.error("invalid_state", "Cannot retrieve preferences", null)
            return
        }
        when (call.method) {
            "getString" -> {
                result.success(prefs.getString(call.argument("key"), null))
            }
            "getInt" -> {
                result.success(prefs.getInt(call.argument("key"), 0))
            }
            "getDouble" -> {
                result.success(prefs.getFloat(call.argument("key"), 0F).toDouble())
            }
            "getBool" -> {
                result.success(prefs.getBoolean(call.argument("key"), false))
            }
            "setString" -> {
                prefs.edit().putString(call.argument("key"), call.argument("value")).apply()
                result.success(null)
            }
            "setInt" -> {
                prefs.edit().putInt(
                    call.argument("key"),
                    call.argument("value")
                        ?: throw IllegalArgumentException("Unexpected value parameter")
                ).apply()
                result.success(null)
            }
            "setDouble" -> {
                prefs.edit().putFloat(
                    call.argument("key"),
                    call.argument<Double>("value")?.toFloat()
                        ?: throw IllegalArgumentException("Unexpected value parameter")
                ).apply()
                result.success(null)
            }
            "setBool" -> {
                prefs.edit().putBoolean(
                    call.argument("key"),
                    call.argument("value")
                        ?: throw IllegalArgumentException("Unexpected value parameter")
                ).apply()
                result.success(null)
            }
            "containsKey" -> {
                result.success(prefs.contains(call.argument("key")))
            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        context = binding.activity.applicationContext
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        context = null;
    }
}
