import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Home/homeController.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';
import 'package:twentyfourby_seven/Utils/commonCardHome.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  var homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: GlobalText('Drawer Header'),
            ),
            ListTile(
              title: GlobalText('Item 1'),
              onTap: homeController.closeDrawer,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AddImage.homeLogo,
                    height: Get.height * 0.06,
                    width: Get.width * 0.5,
                  ),
                  IconButton(
                      onPressed: () {
                        homeController.openDrawer();
                      },
                      icon: Container(
                          height: Get.height * 0.04,
                          width: Get.width * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(05),
                              border: Border.all(
                                  width: 1.0, style: BorderStyle.solid)),
                          child:
                              Center(child: Icon(Icons.format_list_bulleted))))
                ],
              ),
              Divider(
                color: MyColor.colorRedHome,
                height: Get.height * 0.009,
                thickness: 4.0,
              ),
              Divider(
                color: MyColor.colorBlueHome,
                height: Get.height * 0.009,
                thickness: 4.0,
              ),
              Container(
                height: Get.height * 0.6,
                width: Get.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AddImage.homeBg), fit: BoxFit.cover),
                ),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.blue.withOpacity(0.5),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: Get.height * 0.05,
                              width: Get.width * 0.2,
                              color: MyColor.white,
                              child: Center(
                                child: const GlobalText(
                                  'Virtual',
                                  color: MyColor.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              height: Get.height * 0.05,
                              width: Get.width * 0.25,
                              color: MyColor.nevyBlue,
                              child: Center(
                                child: const GlobalText(
                                  'Mail Box',
                                  color: MyColor.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 0.012,
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.95,
                          color: MyColor.nevyBlue,
                          child: Center(
                            child: GlobalText(
                              '40% off for the first 500 customers.',
                              textAlign: TextAlign.center,
                              color: Colors.white,
                              fontSize: Get.height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.010,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.search, color: Colors.white),
                          label: GlobalText(
                            'Browse Locations',
                            fontWeight: FontWeight.w700,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MyColor.yellowGold,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            textStyle: TextStyle(
                              fontSize: 18, // Font size
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CommonCard(
                imagePath: AddImage.watchHomeGif,
                titleText: 'ANYTIME',
                detailsText:
                    'Instant mail notification\n High resolution image',
              ),
              CommonCard(
                imagePath: AddImage.worldWideGif,
                titleText: 'ANYWHERE',
                detailsText:
                    'Manage the Digital Box \n See Your Account \nNo Clutter\n No Fuss',
              ),
              CommonCard(
                imagePath: AddImage.responsiveGif,
                titleText: 'MOBILE ACCESS',
                detailsText:
                    'Through User Friendly Application \n iOS and Android',
              ),
              CommonCard(
                imagePath: AddImage.responsiveGif,
                titleText: 'REAL BUSINESS ADDRESS',
                detailsText:
                    'You got professional real street address with suite number no P.O box.',
              ),
              GlobalText('Digital Mailroom Process'),
              SizedBox(
                height: Get.height * 0.05,
              ),
              GlobalText(
                'How Does The 24x7Mail Works for you?',
                fontSize: Get.height * 0.025,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Container(
                height: Get.height * 0.45,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(color: MyColor.yellowGold)),
                child: YoutubePlayer(
                  controller: homeController.youtubeController,
                  liveUIColor: Colors.amber,
                ),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              GlobalText('Recent Blogs'),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Row(
                children: [
                  Card(
                      child: Container(
                    height: Get.height * 0.5,
                    width: Get.width * 0.35,
                    color: MyColor.nevyBlue,
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
