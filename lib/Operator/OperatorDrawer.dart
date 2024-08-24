import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Operator/uploadNewMail_screen.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import 'assign_mail_Screen.dart';
import 'mailMaanagement_Screen.dart';

class OperatorDrawer extends StatelessWidget {
  OperatorDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColor.cardIconColor,
      elevation: 2.0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: MyColor.white,
            ),
            child: Center(
              child: Image.asset(AddImage.homeLogo, height: 80),
            ),
          ),
          _createDrawerItem(
            icon: Icons.home,
            text: ' Request 0 ', onTap: () {},
            // onTap: () => Get.to(() => CustomerView()),
          ),
          _createDrawerItem(
            icon: Icons.upload,
            text: 'Upload New Mail',
            onTap: () async {
              Get.to(() => UploadNewMailScreen());
            },
          ),
          _createDrawerItem(
            icon: Icons.mail,
            text: ' Assign Mail',
            onTap: () async {
              Get.to(() => AssignMailScreen());
            },
          ),
          _createDrawerItem(
            icon: Icons.people,
            text: 'Mail Management',
            onTap: () async {
              Get.to(() => MailManagementScreen());
            },
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
      leading: Icon(icon, color: MyColor.nevyBlue),
      title: GlobalText(
        text,
        fontWeight: FontWeight.w700,
        fontSize: Get.height * 0.02,
      ),
      trailing:
          Icon(Icons.arrow_forward_ios, size: 16, color: MyColor.nevyBlue),
      onTap: onTap,
    );
  }
}
