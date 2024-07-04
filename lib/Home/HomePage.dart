import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Home/homeController.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';
import 'package:twentyfourby_seven/Utils/commonCardHome.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  var homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: () {},
                      icon: const Icon(Icons.format_list_bulleted))
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
                          label: GlobalText('Browse Locations'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
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
              Container(
                height: Get.height * 0.45,
                width: Get.width * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(color: MyColor.yellowGold)),
                child: WebView(
                  initialUrl: homeController.url,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
