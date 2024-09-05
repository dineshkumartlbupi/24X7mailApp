import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Home/homeController.dart';
import 'package:twentyfourby_seven/Service/api.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/addImage.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import '../customer_Address/readMailView.dart';
import '../customer_Address/shipment/pastShipment.dart';
import '../customer_Address/shipment/pendingShipment.dart';
import '../customer_Address/shipment/pickUpView.dart';
import '../customer_Address/shipment_customer/MailViewAll.dart';
import '../customer_Address/traceList.dart';
import '../customer_Address/unreadMailView.dart';
import 'customerController.dart';
import 'customerView.dart';

class CustomerDrawer extends StatelessWidget {
  CustomerDrawer({super.key});
  final homeController = Get.put(HomeController());
  final customerController = Get.put(CustomerController());

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
            icon: Icons.mail,
            text: 'Index',
            onTap: () => Get.to(() => CustomerView()),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
            child: PopupMenuButton<String>(
              onSelected: (String newValue) async {
                pastShipmentList();

                if (newValue == 'Past Shipment') {
                  Get.to(() => PastShipingList());
                } else if (newValue == 'Pending Shipment') {
                  Get.to(() => PendingShipment());
                } else if (newValue == 'Picked Up') {
                  Get.to(() => PickupView());
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Pending Shipment',
                  child: GlobalText(
                    'Pending Shipment',
                    fontSize: Get.height * 0.02,
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Past Shipment',
                  child: GlobalText(
                    'Past Shipment',
                    fontSize: Get.height * 0.02,
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Picked Up',
                  child: GlobalText(
                    'Picked Up',
                    fontSize: Get.height * 0.02,
                  ),
                ),
              ],
              child: Row(
                children: [
                  const Icon(Icons.open_in_browser, color: MyColor.nevyBlue),
                  SizedBox(width: Get.width * 0.02),
                  GlobalText(
                    'Outgoing Mail',
                    fontWeight: FontWeight.w700,
                    fontSize: Get.height * 0.02,
                  ),
                  Spacer(),
                  const Icon(Icons.arrow_drop_down, color: MyColor.nevyBlue),
                ],
              ),
            ),
          ),
          _createDrawerItem(
            icon: Icons.view_timeline_outlined,
            text: 'View All',
            onTap: () async {
              Get.to(() => MailViewAll());
            },
          ),
          _createDrawerItem(
            icon: Icons.delete,
            text: 'Trace',
            onTap: () async {
              Get.to(() => traceList());
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: PopupMenuButton<String>(
              onSelected: (String newValue) {
                customerController.selectedOption?.value = newValue;
                if (newValue == 'read') {
                  Get.to(() => ReadMailView());
                } else if (newValue == 'unread') {
                  Get.to(() => UnreadMailView());
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'read',
                  child: GlobalText(
                    'Read',
                    fontSize: Get.height * 0.02,
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'unread',
                  child: GlobalText(
                    'Unread',
                    fontSize: Get.height * 0.02,
                  ),
                ),
              ],
              child: Row(
                children: [
                  Icon(Icons.filter_alt_rounded, color: MyColor.nevyBlue),
                  SizedBox(width: Get.width * 0.02),
                  GlobalText(
                    'Filter',
                    fontWeight: FontWeight.w700,
                    fontSize: Get.height * 0.02,
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down, color: MyColor.nevyBlue),
                ],
              ),
            ),
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
