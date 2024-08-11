import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';

import 'globalText.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget yesLabel;
  final Widget noLabel;

  final List<Widget> actions;

  const CommonDialog({
    super.key,
    required this.title,
    required this.content,
    required this.yesLabel,
    required this.noLabel,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 20,
      backgroundColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(
            color: MyColor.colorBlueHome, style: BorderStyle.solid),
      ),
      title: GlobalText('Are you sure that you want sent request for $title?'),
      content: content,
      actions: [
        TextButton(onPressed: () => Get.back(), child: yesLabel),
        TextButton(onPressed: () {}, child: noLabel),
      ],
    );
  }
}
