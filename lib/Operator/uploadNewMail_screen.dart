import 'package:flutter/material.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import '../Service/api.dart';

class UploadNewMailScreen extends StatelessWidget {
  const UploadNewMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: GlobalText('Upload New Mail', fontWeight: FontWeight.w600),
          bottom: TabBar(
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(text: 'Bulk Upload'),
              Tab(text: 'Upload By Customer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // First tab content
            Container(
              color: Colors.yellow[700],
              child: Column(
                children: [
                  GlobalText('1. Choose Mail Type'),
                ],
              ),
            ),

            Container(
              color: MyColor.backgroundLogin,
              child: InkWell(
                onTap: () async {
                  await getNewMailOperator();
                },
                child: Text('Upload By Customer Content'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
