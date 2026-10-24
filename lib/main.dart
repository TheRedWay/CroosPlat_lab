import 'package:flutter/material.dart';
import 'package:lab/di/di.dart';
import 'my_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  FlutterError.onError = (details) {
    return talker.handle(details.exception, details.stack);
  };

  runApp(myApp());
}



