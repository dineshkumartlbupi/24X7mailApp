import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Login/loginScreen.dart';

import 'Customer/customerController.dart';
import 'Operator/operatorController.dart';
import 'Utils/SharedPrefrance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.getInstance();

  await SharedPrefs.getInstance();
  Get.lazyPut(() => OperatorController());
  Get.lazyPut(() => CustomerController());
  FlutterError.onError = (details) async {
    if (details.stack != null) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      print(
          '${details.exception}\n${details.stack}');
    } else {
      FlutterError.presentError(details);
    }
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (context, widget){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginScreen(),
          //home: Homepage(),
        );
      },
    );
  }
}
