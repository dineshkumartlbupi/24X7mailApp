import 'package:flutter/material.dart';

import '../Utils/globalText.dart';

class OperatorCustomerView extends StatelessWidget {
  const OperatorCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GlobalText('Customers'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTableWidget(),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Text('#')),
        DataColumn(label: Text('Mailbox')),
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Business Name')),
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('Plan')),
        DataColumn(label: Text('Plan Type')),
        DataColumn(label: Text('Registered Date')),
        DataColumn(label: Text('USPS Received')),
        DataColumn(label: Text('Status')),
        DataColumn(label: Text('Deleted')),
        DataColumn(label: Text('Remote Login')),
        DataColumn(label: Text('Action')),
      ],
      rows: <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1')),
            DataCell(
              InkWell(
                onTap: () {
                  // Implement navigation or any action when tapped
                  print('Navigating to mailbox 981019');
                },
                child: Text(
                  '981019',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ),
            DataCell(Text('Ashutosh Gurjar')),
            DataCell(Text('N/A')),
            DataCell(Text('ashutosh@yopmail.com')),
            DataCell(Text('Silver')),
            DataCell(Text('Monthly')),
            DataCell(Text('Thursday, June 27, 2024')),
            DataCell(
              Row(
                children: [
                  Icon(Icons.close, color: Colors.red),
                  SizedBox(width: 5),
                  Text('Received'),
                ],
              ),
            ),
            DataCell(
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 10),
                  SizedBox(width: 5),
                  Text('Active'),
                ],
              ),
            ),
            DataCell(Text('NO')),
            DataCell(
              IconButton(
                icon: Icon(Icons.login, color: Colors.green),
                onPressed: () {
                  // Implement remote login action
                  print('Remote login for Ashutosh Gurjar');
                },
              ),
            ),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          color: MaterialStateColor.resolveWith(
              (states) => Color(0xFFE37878)), // Background color for row
          cells: <DataCell>[
            DataCell(Text('2')),
            DataCell(
              InkWell(
                onTap: () {
                  // Implement navigation or any action when tapped
                  print('Navigating to mailbox 498559');
                },
                child: Text(
                  '498559',
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                ),
              ),
            ),
            DataCell(Text('Customer One')),
            DataCell(Text('Ativa Developer')),
            DataCell(Text('customer@yopmail.com')),
            DataCell(Text('Silver')),
            DataCell(Text('Monthly')),
            DataCell(Text('Wednesday, June 26, 2024')),
            DataCell(
              Row(
                children: [
                  Icon(Icons.close, color: Colors.red),
                  SizedBox(width: 5),
                  Text('Received'),
                ],
              ),
            ),
            DataCell(
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.green, size: 10),
                  SizedBox(width: 5),
                  Text('Active'),
                ],
              ),
            ),
            DataCell(Text('YES')),
            DataCell(
              IconButton(
                icon: Icon(Icons.login, color: Colors.green),
                onPressed: () {
                  // Implement remote login action
                  print('Remote login for Customer One');
                },
              ),
            ),
            DataCell(
              IconButton(
                icon: Icon(Icons.person_off, color: Colors.black),
                onPressed: () {
                  // Implement delete action
                  print('Deleting user Customer One');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
