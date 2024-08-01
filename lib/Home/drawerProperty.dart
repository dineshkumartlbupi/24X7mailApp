import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Home/requestLocation.dart';
import 'package:twentyfourby_seven/SignUp/signUpView.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';

import '../Login/loginScreen.dart';
import '../Utils/globalText.dart';
import 'homeController.dart';

class DrawerProperty extends StatelessWidget {
  DrawerProperty({super.key});
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColor.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AddImage.homeLogo, height: 80),
                SizedBox(height: 10),
                GlobalText(
                  'Menu',
                  fontSize: 20,
                  color: MyColor.white,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
          _createDrawerItem(
            icon: Icons.login,
            text: 'Login',
            onTap: () => Get.to(() => LoginScreen()),
          ),
          _createDrawerItem(
            icon: Icons.account_box,
            text: 'Sign Up',
            onTap: () {
              Get.to(() => RequestLocation());
            },
          ),
          _createDrawerItem(
            icon: Icons.location_on,
            text: 'Locations',
            onTap: () => Get.to(() => LoginScreen()),
          ),
          _createDrawerItem(
            icon: Icons.backup_table_rounded,
            text: 'Blogs',
            onTap: () => Get.to(() => LoginScreen()),
          ),
          _createDrawerItem(
            icon: Icons.view_timeline,
            text: 'View Plans',
            onTap: () => Get.to(() => LoginScreen()),
          ),
          _createDrawerItem(
            icon: Icons.people_alt_rounded,
            text: 'Partner Program',
            onTap: () => Get.to(() => SignUpView()),
          ),
          Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: GlobalText(
              'Other',
              fontSize: 18,
              color: MyColor.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          _createDrawerItem(
            icon: Icons.settings,
            text: 'Settings',
            onTap: () {},
          ),
          _createDrawerItem(
            icon: Icons.help,
            text: 'Help & Feedback',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: MyColor.darkCyan),
      title: GlobalText(
        text,
        fontWeight: FontWeight.w700,
      ),
      trailing:
          Icon(Icons.arrow_forward_ios, size: 16, color: MyColor.deepPurple),
      onTap: onTap,
    );
  }
}
