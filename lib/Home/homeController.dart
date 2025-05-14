import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final String url = 'https://www.youtube.com/watch?v=wbPV81-BgW0';
  final String linkText =
      '24x7Mail: Your Virtual Mailbox for Seamless Communication.';
  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'wbPV81-BgW0',
    flags: const YoutubePlayerFlags(
      isLive: true,
    ),
  );

}
