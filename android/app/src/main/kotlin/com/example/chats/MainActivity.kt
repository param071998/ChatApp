package com.example.chats






import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.widget.Toast








class MainActivity: FlutterActivity() {

    companion object {
        const val CHANNEL = "flutter.toast.message.channel"
        const val METHOD_TOAST = "toast"
        const val KEY_MESSAGE = "message"
    }


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->

            if (call.method == METHOD_TOAST) {
                val message = call.argument<String>(KEY_MESSAGE)
                Toast.makeText(this@MainActivity, message, Toast.LENGTH_SHORT).show()
            }
        }
    }
}
