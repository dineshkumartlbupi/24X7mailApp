import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Utils/globalText.dart';
import 'operatorController.dart';

class OperatorCustomerView extends StatelessWidget {
  OperatorCustomerView({super.key});
  var mailController = Get.put(OperatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GlobalText('Customers'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(() {
            if (mailController.isLoadingCustomer.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (mailController.customerList.value.data?.length == null) {
              return Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.35),
                  child: Center(
                    child: GlobalText(
                      'No data Found',
                    ),
                  ));
            } else {
              return DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Mail Box')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Business Name')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Plan')),
                  DataColumn(label: Text('Plan')),
                  DataColumn(label: Text('Plan')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Deleted')),
                  DataColumn(label: Text('Actions')),
                  DataColumn(label: Text('Delete')),
                ],
                rows: mailController.customerList.value.data!.map((customer) {
                  return DataRow(
                    cells: [
                      DataCell(Text(customer.id.toString())),
                      DataCell(
                        InkWell(
                          onTap: () {
                            log('Navigating to mailbox ${customer.mailBoxNum}');
                          },
                          child: GlobalText(
                            customer.mailBoxNum.toString(),
                            color: Colors.blue,
                            textDecoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      DataCell(GlobalText(customer.fname ?? 'No Name')),
                      DataCell(GlobalText(customer.businessName ?? 'N/A')),
                      DataCell(GlobalText(customer.email.toString())),
                      DataCell(GlobalText(customer.plan.toString())),
                      DataCell(GlobalText(customer.plan.toString())),
                      DataCell(GlobalText(customer.plan.toString())),
                      DataCell(
                        Row(
                          children: [
                            Icon(Icons.circle,
                                color: customer.userStatus == 'Active'
                                    ? Colors.green
                                    : Colors.red,
                                size: 10),
                            SizedBox(width: 5),
                            GlobalText(customer.userStatus.toString()),
                          ],
                        ),
                      ),
                      DataCell(GlobalText(customer.isDeleted! ? 'YES' : 'NO')),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.login, color: Colors.green),
                          onPressed: () {
                            log('Remote login for ${customer.fname}');
                          },
                        ),
                      ),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.person_off, color: Colors.black),
                          onPressed: () {
                            log('Deleting user ${customer.fname}');
                          },
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            }
          }),
        ));
  }
}
