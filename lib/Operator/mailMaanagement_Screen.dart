import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../Service/api.dart';
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
            // First Tab: Mailbox Data Table
            Container(
              margin: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Address')),
                      DataColumn(label: Text('Carrier')),
                      DataColumn(label: Text('Cost')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Tracking Number')),
                    ],
                    rows: mailsData.mailOperationsPick.value.data == null
                        ? [
                            const DataRow(cells: [
                              DataCell(
                                Center(child: GlobalText('No data Found')),
                                placeholder: true,
                                showEditIcon: false,
                              ),
                              DataCell.empty,
                              DataCell.empty,
                              DataCell.empty,
                              DataCell.empty,
                              DataCell.empty,
                            ])
                          ]
                        : mailsData.mailOperationsPick.value.data!
                            .map((shipment) {
                            final shippedDetails = shipment.shippedDetails;
                            final firstDetail =
                                shippedDetails?.isNotEmpty == true
                                    ? shippedDetails![0]
                                    : null;
                            final formattedDate = firstDetail != null
                                ? DateFormat('dd/MM/yyyy').format(
                                    DateTime.parse(
                                        firstDetail.updatedAt?.toString() ??
                                            ''))
                                : '';
                            return DataRow(cells: [
                              DataCell(GlobalText(
                                firstDetail?.shippingAddress?.name
                                        ?.toString() ??
                                    '',
                              )),
                              DataCell(GlobalText(
                                firstDetail?.shippingAddress?.address1
                                        ?.toString() ??
                                    '',
                              )),
                              DataCell(GlobalText(
                                firstDetail?.shipmentCareer?.toString() ?? '',
                              )),
                              DataCell(GlobalText(
                                '\$${firstDetail?.shippingCost?.toString() ?? ''}',
                              )),
                              DataCell(GlobalText(formattedDate)),
                              DataCell(GlobalText(
                                '#${firstDetail?.trackingNumber?.toString() ?? ''}',
                                color: Colors.blue,
                              )),
                            ]);
                          }).toList(),
                  )),
            ),

            // Second Tab: Shipment Data with Search and Date Picker
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
                          // Search Field
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
                                          hintText: 'Mailbox, Name or Mail ID',
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
                              width: 16.0), // Space between search and date

                          // Date Picker
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
                      const SizedBox(
                          height: 16.0), // Space before the data table

                      // Shipment Data Table
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
                                final formattedDate = firstDetail != null
                                    ? DateFormat('dd/MM/yyyy').format(
                                        DateTime.parse(firstDetail.updatedAt
                                                ?.toString() ??
                                            ''))
                                    : '';
                                return DataRow(cells: [
                                  DataCell(GlobalText(
                                    firstDetail?.shippingAddress?.name
                                            ?.toString() ??
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
                                  DataCell(GlobalText(formattedDate)),
                                  DataCell(GlobalText(
                                    '#${firstDetail?.trackingNumber?.toString() ?? ''}',
                                    color: Colors.blue,
                                  )),
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

            // Third Tab: Search with Date Range and Status Filter
            Container(
              padding: const EdgeInsets.all(16.0), // Overall container padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 5), // Shadow for subtle depth
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search Field
                  TextField(
                    onChanged: (value) {
                      mailsData.searchQuery.value = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Search Mailbox, Name, or Mail ID',
                      labelStyle:
                          TextStyle(color: Colors.grey[700], fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.grey[400]!),
                      ),
                      suffixIcon: Icon(Icons.search, color: Colors.grey[600]),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Date Range Picker
                  Obx(() {
                    return GestureDetector(
                      onTap: () async {
                        DateTimeRange? picked = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2025),
                        );
                        mailsData.selectDateRange(picked);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: GlobalText(
                            mailsData.selectedDateRange.value != null
                                ? '${DateFormat('dd-MM-yyyy').format(mailsData.selectedDateRange.value!.start)} - ${DateFormat('dd-MM-yyyy').format(mailsData.selectedDateRange.value!.end)}'
                                : 'Select Date',
                            color: Colors.grey[700],
                            fontSize: 16),
                      ),
                    );
                  }),
                  const SizedBox(height: 16),

                  // Status Dropdown
                  Obx(() {
                    return DropdownButtonFormField<String>(
                      value: mailsData.selectedStatus.value.isEmpty
                          ? null
                          : mailsData.selectedStatus.value,
                      hint: const GlobalText('Select Status', fontSize: 16),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 14),
                      ),
                      isExpanded: true,
                      items: const [
                        DropdownMenuItem(
                            value: 'All', child: GlobalText('All')),
                        DropdownMenuItem(
                            value: 'Assigned', child: GlobalText('Assigned')),
                        DropdownMenuItem(
                            value: 'Scan Request',
                            child: GlobalText('Scan Request')),
                        DropdownMenuItem(
                            value: 'Shipment Request',
                            child: GlobalText('Shipment Request')),
                        DropdownMenuItem(
                            value: 'Shred Request',
                            child: GlobalText('Shred Request')),
                        DropdownMenuItem(
                            value: 'Recycle Request',
                            child: GlobalText('Recycle Request')),
                      ],
                      onChanged: mailsData.selectStatus,
                    );
                  }),
                  const SizedBox(height: 16),

                  // Data Table with Pagination
                  Expanded(
                    child: Obx(() {
                      if (mailsData.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: GlobalText('Mailbox Number')),
                            DataColumn(label: GlobalText('Customer Name')),
                            DataColumn(label: GlobalText('Sender Name')),
                            DataColumn(label: GlobalText('Status')),
                            DataColumn(label: GlobalText('Date')),
                            DataColumn(label: GlobalText('Mail ID')),
                          ],
                          rows: mailsData.mailOperationsAssignData.value.data
                                  ?.map<DataRow>((mail) {
                                final formattedDate = DateFormat('dd-MM-yyyy')
                                    .format(DateTime.parse(
                                        mail.updatedAt.toString()));
                                return DataRow(
                                  cells: <DataCell>[
                                    DataCell(GlobalText(
                                      mail.reciver?.mailBoxNum.toString() ?? '',
                                    )),
                                    DataCell(GlobalText(
                                      mail.reciver?.fname.toString() ?? '',
                                    )),
                                    DataCell(GlobalText(
                                      mail.sender.toString().capitalizeFirst ??
                                          '',
                                    )),
                                    DataCell(GlobalText(
                                      mail.currentStatus.toString() ?? '',
                                    )),
                                    DataCell(GlobalText(
                                      formattedDate,
                                    )),
                                    DataCell(GlobalText(
                                      mail.mailId?.mailBoxId.toString() ?? '',
                                    )),
                                  ],
                                );
                              }).toList() ??
                              [], // If data is null, return an empty list
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),

            // Fourth Tab: Search Mail ID
            SizedBox(
              height: Get.height * 0.05,
              width: Get.width * 0.5,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GlobalText(
                        'Search Mail',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(height: 16.0),

                      // Mail ID Search
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              controller: mailsData.searchMailId.value,
                              decoration: const InputDecoration(
                                hintText: 'Mail ID',
                                border: OutlineInputBorder(),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter Mail ID';
                                }
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              onTap: () async {
                                if (mailsData
                                        .searchMailId.value.text.isNotEmpty &&
                                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(mailsData
                                            .searchMailId.value.text)) {
                                  await searchMail(
                                      mailsData.searchMailId.value.text);
                                }
                              },
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16.0),

                      // No Result Found
                      const Center(
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
            ),
          ],
        ),
      ),
    );
  }
}
