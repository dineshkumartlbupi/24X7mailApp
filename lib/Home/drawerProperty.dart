import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Home/requestLocation.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';

import '../Login/loginScreen.dart';
import '../Service/api.dart';
import '../Utils/globalText.dart';
import 'homeController.dart';

class DrawerProperty extends StatelessWidget {
  DrawerProperty({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: MyColor.white,
            ),
            child: Image.asset(AddImage.homeLogo),
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: GlobalText(
              'Login',
              fontWeight: FontWeight.w700,
              onTap: () => Get.to(() => LoginScreen()),
            ),
            onTap: homeController.closeDrawer,
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: GlobalText('sign up', fontWeight: FontWeight.w700,
                onTap: () async {
              await getViewState();
              Get.to(() => RequestLocation());
            }),
            onTap: homeController.closeDrawer,
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: GlobalText(
              'Locations',
              fontWeight: FontWeight.w700,
              onTap: () => Get.to(() => LoginScreen()),
            ),
            onTap: homeController.closeDrawer,
          ),
          ListTile(
            leading: Icon(Icons.backup_table_rounded),
            title: GlobalText(
              'Blogs',
              fontWeight: FontWeight.w700,
              onTap: () => Get.to(() => LoginScreen()),
            ),
            onTap: homeController.closeDrawer,
          ),
          ListTile(
            leading: const Icon(Icons.view_timeline),
            title: GlobalText(
              'View Plans',
              fontWeight: FontWeight.w700,
              onTap: () => Get.to(() => LoginScreen()),
            ),
            onTap: homeController.closeDrawer,
          ),
          ListTile(
            leading: Icon(Icons.people_alt_rounded),
            title: GlobalText(
              'Partner Program',
              fontWeight: FontWeight.w700,
              onTap: () => Get.to(() => LoginScreen()),
            ),
            onTap: homeController.closeDrawer,
          ),
        ],
      ),
    );
  }
}
