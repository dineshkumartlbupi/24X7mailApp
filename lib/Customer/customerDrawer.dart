import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Customer/customerController.dart';

import '../Utils/Mycolor.dart';
import '../Utils/addImage.dart';
import '../Utils/globalText.dart';

class CustomerDrawer extends StatelessWidget {
  CustomerDrawer({super.key});
  final customerController = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColor.white,
            ),
            child: Image.asset(AddImage.homeLogo),
          ),
          ListTile(
            leading: const Icon(Icons.mail),
            title: GlobalText(
              'Index',
              fontWeight: FontWeight.w700,
              onTap: () {},
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (String newValue) {
              customerController.selectedOption?.value = newValue;
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Pending Shipment',
                child: GlobalText('Pending Shipment'),
              ),
              const PopupMenuItem<String>(
                value: 'Past Shipment',
                child: GlobalText('Past Shipment'),
              ),
              const PopupMenuItem<String>(
                value: 'Picked Up',
                child: GlobalText('Picked Up'),
              ),
            ],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.open_in_browser),
                GlobalText('Outgoing Mail'),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.view_timeline_outlined),
            title: GlobalText(
              'View All',
              fontWeight: FontWeight.w700,
              onTap: () {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: GlobalText(
              'Trace',
              fontWeight: FontWeight.w700,
              onTap: () {},
            ),
          ),
          PopupMenuButton<String>(
            onSelected: (String newValue) {
              customerController.selectedOption?.value = newValue;
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'read',
                child: GlobalText('Read'),
              ),
              const PopupMenuItem<String>(
                value: 'Past Shipment',
                child: GlobalText('Unread'),
              ),
            ],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.filter_alt_rounded),
                GlobalText('Filter'),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
