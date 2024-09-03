import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twentyfourby_seven/Operator/operator_report/reportController.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

class StatementReport extends StatelessWidget {
  StatementReport({super.key});
  var statementData = Get.put(OperationReport());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const GlobalText(
            'Statements',
            fontWeight: FontWeight.w700,
            color: MyColor.brightBlue,
          ),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: GlobalText('#')),
                DataColumn(label: GlobalText('Date')),
                DataColumn(label: GlobalText('Active Customer')),
                DataColumn(label: GlobalText('Revenue')),
                DataColumn(label: GlobalText('Store Payout')),
                DataColumn(label: GlobalText('License Fee')),
              ],
              rows: statementData.statementReportModel.value.data!
                  .asMap()
                  .entries
                  .map<DataRow>((entry) {
                final index = entry.key;
                final item = entry.value;
                final formattedDate = DateFormat('MM-dd-yyyy')
                    .format(DateTime.parse(item.date.toString()));
                return DataRow(
                  cells: [
                    DataCell(GlobalText((index + 1).toString())),
                    DataCell(GlobalText(formattedDate.toString())),
                    DataCell(GlobalText(item.operatorTotalUser
                        .toString()
                        .replaceAll('[', '')
                        .replaceAll(']', ''))),
                    DataCell(GlobalText(item.revenue.toString())),
                    DataCell(GlobalText(item.storedPayout.toString())),
                    DataCell(GlobalText(item.licenceFee.toString())),
                  ],
                );
              }).toList(), // Convert iterable to list
            )));
  }
}
