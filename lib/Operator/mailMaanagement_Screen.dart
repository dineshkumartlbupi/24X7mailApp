import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/Mycolor.dart';
import '../Utils/globalText.dart';

class MailManagementScreen extends StatelessWidget {
  const MailManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: GlobalText('Mail Management', fontWeight: FontWeight.w600),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Local Pickup'),
              Tab(text: 'Past Shipment '),
              Tab(text: 'Assigned Mail '),
              Tab(text: 'Past Shipment '),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: EdgeInsets.all(08),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(
                      '1. Choose Mail Type',
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: Get.height * 0.002,
                    ),
                    GlobalText(
                      '2. Upload Photo',
                      fontWeight: FontWeight.w700,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () async {},
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 2,
                                ),
                                color: Colors.grey[200],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * 0.02,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              child: const GlobalText(
                                'Upload',
                                color: MyColor.cardIColorIndigo,
                                fontWeight: FontWeight.w700,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: MyColor.backgroundLogin,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.search,
                          color: MyColor.cardIColorIndigo,
                        ),
                        hintText: 'Mailbox, Customer',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: Get.height * 0.05,
              width: Get.width * 0.5,
              color: Colors.purple,
            ),
            Container(
              height: Get.height * 0.05,
              width: Get.width * 0.5,
              color: Colors.indigo,
            )
          ],
        ),
      ),
    );
  }
}
