import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Operator/operator_report/reportController.dart';

import '../../Utils/globalText.dart';

class CloseAccountView extends StatelessWidget {
  CloseAccountView({super.key});
  var reportController = Get.put(OperationReport());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GlobalText(
          'Closed Accounts',
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  hintText: 'MailBox or Name',
                  suffixIcon: IconButton(
                      onPressed: () =>
                          reportController.searchController.clear(),
                      icon: const Icon(Icons.clear)),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  reportController.searchQuery.value =
                      value; // Updates search query
                },
                controller: reportController.searchController,
              ),
            ),
            Obx(
              () => reportController.filteredList.isEmpty
                  ? const Center(
                      child: GlobalText(
                          'No results found', // Display message when list is empty
                          fontSize: 16),
                    )
                  : SizedBox(
                      height: Get.height * 0.02,
                      child: ListView.builder(
                        itemCount: reportController.filteredList.length,
                        itemBuilder: (context, index) {
                          final item = reportController.filteredList[index];

                          return ListTile(
                            title: GlobalText(item.userinfo?.mailBoxNum ??
                                'No MailBox Number'),
                            subtitle: GlobalText(
                                '${item.userinfo?.fname ?? 'No First Name'} ${item.userinfo?.lname ?? 'No Last Name'}'),
                          );
                        },
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, // Enable horizontal scrolling
                child: Obx(
                  () => Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        children: [
                          _buildTableHeader('No.'),
                          _buildTableHeader('Mailbox'),
                          _buildTableHeader('Customer'),
                          _buildTableHeader('Business Name'),
                          _buildTableHeader('Closing Date'),
                          _buildTableHeader('Mail Items'),
                        ],
                      ),
                      ...?reportController.closeAccountData.value.data
                          ?.asMap()
                          .entries
                          .map(
                        (entry) {
                          int index = entry.key;
                          var item = entry.value;

                          return TableRow(
                            children: [
                              _buildTableCell(
                                  (index + 1).toString()), // Dynamic index
                              _buildTableCell(
                                item.userinfo?.mailBoxNum?.toString() ??
                                    'N/A', // Null check for mailbox number
                              ),
                              _buildTableCell(
                                '${item.userinfo?.fname ?? ''} ${item.userinfo?.lname ?? ''}', // Combining first and last name
                              ),
                              _buildTableCell(
                                item.userinfo?.businessName?.toString() ??
                                    'N/A', // Null check for business name
                              ),
                              _buildTableCell(
                                '' ?? '', // Null check for closing date
                              ),
                              _buildTableCell(
                                '' ?? '0', // Null check for mail items count
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlobalText(
        text,
        fontWeight: FontWeight.bold,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GlobalText(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
