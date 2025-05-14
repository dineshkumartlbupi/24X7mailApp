import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Operator/operator_report/reportController.dart';
import 'package:twentyfourby_seven/Operator/operator_report/statement_report.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';

import '../../Utils/globalText.dart';
import 'close_account_view.dart';

class OperatorReports extends StatelessWidget {
  OperatorReports({super.key});
  var reportController = Get.put(OperationReport());
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
                        const Icon(
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
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.002,
                  ),
                ],
              ),
            ],
            title: const GlobalText('Operations', fontWeight: FontWeight.w600),
            bottom: const TabBar(
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
                margin: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Allows horizontal scrolling
                  child: Obx(
                    () => Column(
                      children: [
                        DataTable(
                          columns: const [
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
                          rows: reportController
                                  .operatorCustomerModel.value.data
                                  ?.map<DataRow>((item) {
                                final userinfo = item.userinfo;

                                return DataRow(cells: [
                                  DataCell(GlobalText(
                                      userinfo?.mailBoxNum.toString() ?? '0')),
                                  DataCell(GlobalText(userinfo
                                          ?.fname?.capitalizeFirst ??
                                      '' '${userinfo?.lname?.capitalizeFirst ?? ''}')),
                                  const DataCell(GlobalText('N/A')),
                                  DataCell(
                                      GlobalText(item.assignCount.toString())),
                                  DataCell(GlobalText(
                                      item.openScanCount.toString() ?? '')),
                                  DataCell(GlobalText(
                                      item.shipmentCount.toString() ?? '')),
                                  DataCell(GlobalText(
                                      item.recyleCount.toString() ?? '')),
                                  DataCell(GlobalText(
                                      item.shredCount.toString() ?? '')),
                                  DataCell(GlobalText(
                                      item.pickupCount.toString() ?? '')),
                                  DataCell(GlobalText(
                                      item.rescanCount.toString() ?? '')),
                                  DataCell(
                                      GlobalText(item.total.toString() ?? '')),
                                ]);
                              }).toList() ??
                              [], // Provide an empty list if data is null
                        ),
                      ],
                    ),
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
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          const DataCell(Text('1')),
                          DataCell(Obx(() => GlobalText(
                              '${reportController.operatorOperationModel.value.data?.upload ?? ''}'))),
                          DataCell(Obx(() => GlobalText(
                              '${reportController.operatorOperationModel.value.data?.assing ?? ''}'))),
                          DataCell(Obx(() => GlobalText(
                              '${reportController.operatorOperationModel.value.data?.openScan ?? ''}'))),
                          DataCell(Obx(() => GlobalText(
                              '${reportController.operatorOperationModel.value.data?.shipment ?? ''}'))),
                          DataCell(Obx(() => GlobalText(
                              '${reportController.operatorOperationModel.value.data?.recycle ?? ''}'))),
                          DataCell(Obx(() => GlobalText(
                              '${reportController.operatorOperationModel.value.data?.shred ?? ''}'))),
                          DataCell(Obx(() => GlobalText(
                              '${reportController.operatorOperationModel.value.data?.pickup ?? ''}'))),
                          DataCell(Obx(() => GlobalText(
                              '${reportController.operatorOperationModel.value.data?.rescan ?? ''}'))),
                          DataCell(Obx(() => GlobalText(
                              '${reportController.operatorOperationModel.value.data?.total ?? ''}'))),
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
