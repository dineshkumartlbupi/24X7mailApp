import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Operator/operator_report/statement_report.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';

import '../../Utils/globalText.dart';
import 'close_account_view.dart';

class OperatorReports extends StatelessWidget {
  const OperatorReports({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PopupMenuButton<String>(
                    onSelected: (String newValue) async {
                      if (newValue == 'Statments') {
                        Get.to(() => StatementReport());
                      } else if (newValue == 'Closed Accounts') {
                        Get.to(() => CloseAccountView());
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Statments',
                        child: GlobalText('Statments'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Closed Accounts',
                        child: GlobalText('Closed Accounts'),
                      ),
                    ],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.offline_pin_sharp,
                          color: MyColor.brightBlue,
                        ),
                        SizedBox(
                          width: Get.width * 0.055,
                        ),
                        const GlobalText(
                          'Reports',
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(
                          width: Get.width * 0.025,
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.002,
                  ),
                ],
              ),
            ],
            title: GlobalText('Operations', fontWeight: FontWeight.w600),
            bottom: TabBar(
              automaticIndicatorColorAdjustment: true,
              tabs: [
                Tab(text: 'Customers'),
                Tab(text: 'Opeartors'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                margin: EdgeInsets.all(08),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Allows horizontal scrolling
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('MailBox')),
                      DataColumn(label: Text('Customer')),
                      DataColumn(label: Text('Business Name')),
                      DataColumn(label: Text('Assign')),
                      DataColumn(label: Text('Open & Scan')),
                      DataColumn(label: Text('Shipment')),
                      DataColumn(label: Text('Recycle')),
                      DataColumn(label: Text('Shared')),
                      DataColumn(label: Text('PickUp')),
                      DataColumn(label: Text('Rescan')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: [
                      // Here you can add DataRow objects to represent the data in each row
                      DataRow(cells: [
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                        DataCell(Text('')),
                      ]),
                    ],
                  ),
                ),
              ),
              Container(
                color: MyColor.backgroundLogin,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(label: Text('#')),
                      DataColumn(label: Text('Upload')),
                      DataColumn(label: Text('Assign')),
                      DataColumn(label: Text('Open&Scan')),
                      DataColumn(label: Text('Shipment')),
                      DataColumn(label: Text('Recycle')),
                      DataColumn(label: Text('Shared')),
                      DataColumn(label: Text('PickUp')),
                      DataColumn(label: Text('Rescan')),
                      DataColumn(label: Text('Total')),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('1')),
                          DataCell(Text('4')),
                          DataCell(Text('2')),
                          DataCell(Text('1')),
                          DataCell(Text('1')),
                          DataCell(Text('0')),
                          DataCell(Text('0')),
                          DataCell(Text('0')),
                          DataCell(Text('0')),
                          DataCell(Text('8')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
