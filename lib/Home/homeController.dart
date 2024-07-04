import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeController extends GetxController {
  final String url = 'https://www.youtube.com/watch?v=wbPV81-BgW0';
  final String linkText =
      '24x7Mail: Your Virtual Mailbox for Seamless Communication.';

  @override
  void onInit() {
    if (WebView.platform == null) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.onInit();
  }
}
