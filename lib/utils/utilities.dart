import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Utilities {
  static const platform =  MethodChannel('flutter.toast.message.channel');

  static bool isKeyboardShowing() {
    return WidgetsBinding.instance.window.viewInsets.bottom > 0;
  }

  static closeKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static Future<void> showToast({String? msg}) async {
    // invoke method, provide method name and arguments.
    await platform.invokeMethod('toast', {'message': msg});
  }
}
