import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Utils/Mycolor.dart';
import '../Utils/globalText.dart';
import 'mailManagedController.dart';

class MailManagementScreen extends StatelessWidget {
  MailManagementScreen({super.key});
  var mailsData = Get.put(MailManagedController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title:
              const GlobalText('Mail Management', fontWeight: FontWeight.w600),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Local Pickup'),
              Tab(text: 'Past Shipment '),
              Tab(text: 'Assigned Mail '),
              Tab(text: 'Search Mail '),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              margin: const EdgeInsets.all(08),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const GlobalText(
                      '1. Choose Mail Type',
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: Get.height * 0.002,
                    ),
                    const GlobalText(
                      '2. Upload Photo',
                      fontWeight: FontWeight.w700,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
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
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const GlobalText(
                                  'Search',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller: mailsData.searchCtrl.value,
                                        decoration: const InputDecoration(
                                          hintText: 'Mailbox, Name or Mail Id',
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(
                                            Icons.search,
                                            color: MyColor.yellowGold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                              width: 16.0), // Spacing between columns

                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const GlobalText(
                                  'Date',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        controller:
                                            mailsData.selectedDateCtrl.value,
                                        decoration: const InputDecoration(
                                          hintText: 'Select Date',
                                          border: OutlineInputBorder(),
                                          suffixIcon:
                                              Icon(Icons.calendar_today),
                                        ),
                                        onTap: () async {
                                          final DateTimeRange? pickedDateRange =
                                              await showDateRangePicker(
                                            context: context,
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2100),
                                          );
                                          if (pickedDateRange != null) {
                                            String formattedDateRange =
                                                "${pickedDateRange.start.toLocal().toString().split(' ')[0]} - ${pickedDateRange.end.toLocal().toString().split(' ')[0]}";

                                            mailsData.selectedDateCtrl.value
                                                .text = formattedDateRange;

                                            log("Selected date range: $formattedDateRange");
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: GlobalText('Customer Name')),
                            DataColumn(label: GlobalText('Shipping Address')),
                            DataColumn(label: GlobalText('Shipping Method')),
                            DataColumn(label: GlobalText('Cost')),
                            DataColumn(label: GlobalText('Ship Date')),
                            DataColumn(label: GlobalText('Tracking Number')),
                          ],
                          rows: mailsData.mailOperations.value.data
                                  ?.map((shipment) {
                                final shippedDetails = shipment.shippedDetails;
                                final firstDetail =
                                    shippedDetails?.isNotEmpty == true
                                        ? shippedDetails![0]
                                        : null;
                                final formateDate = DateFormat('dd/MM/yyyy')
                                    .format(DateTime.parse(
                                  firstDetail?.updatedAt?.toString() ?? '',
                                ));

                                return DataRow(cells: [
                                  DataCell(GlobalText(
                                    firstDetail?.shippingAddress?.name
                                            ?.toString()
                                            .capitalizeFirst ??
                                        '',
                                  )),
                                  DataCell(GlobalText(
                                    firstDetail?.shippingAddress?.address1
                                            ?.toString() ??
                                        '',
                                  )),
                                  DataCell(GlobalText(
                                    firstDetail?.shipmentCareer?.toString() ??
                                        '',
                                  )),
                                  DataCell(GlobalText(
                                    '\$${firstDetail?.shippingCost?.toString() ?? ''}',
                                  )),
                                  DataCell(GlobalText(
                                    formateDate ?? '',
                                  )),
                                  DataCell(
                                    GlobalText(
                                      '#${firstDetail?.trackingNumber?.toString() ?? ''}',
                                      color: Colors.blue,
                                    ),
                                  ),
                                ]);
                              }).toList() ??
                              [], // Fallback to empty list if null
                        ),
                      ),
                    ],
                  ),
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
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalText(
                        'Search Mail',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              controller: mailsData.searchMailId.value,
                              decoration: InputDecoration(
                                hintText: 'Mail Id',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Center(
                        child: Column(
                          children: [
                            GlobalText(
                              'No Result Found',
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                            GlobalText(
                              'Search with correct mail id.',
                              textAlign: TextAlign.center,
                              fontSize: 16.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
