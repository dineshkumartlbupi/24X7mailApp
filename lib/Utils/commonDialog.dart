import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final Widget content;

  final List<Widget> actions;

  const CommonDialog({
    Key? key,
    required this.title,
    required this.content,
    this.actions = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure that you want sent request for $title?'),
      content: content,
      actions: [
        TextButton(onPressed: () => Get.back(), child: GlobalText('No')),
        TextButton(onPressed: () {}, child: GlobalText('Yes')),
      ],
    );
  }
}
