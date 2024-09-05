import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'globalText.dart';

class CommonDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget yesLabel;
  final Widget noLabel;

  const CommonDialog({
    super.key,
    required this.title,
    required this.content,
    required this.yesLabel,
    required this.noLabel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 12,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: const BorderSide(
          color: Colors.blueAccent,
          style: BorderStyle.solid,
        ),
      ),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
      actionsPadding: const EdgeInsets.only(bottom: 12, right: 16),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalText(
            'Confirmation',
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.blueAccent,
          ),
          const SizedBox(height: 8),
          GlobalText(
            'Are you sure you want to send a request for $title?', // Dynamic text
            fontSize: 16,
            color: Colors.black87,
          ),
        ],
      ),
      content: content,
      actions: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          icon: const Icon(Icons.check, color: Colors.white),
          label: yesLabel,
          onPressed: () {},
        ),

        // No/Cancel Button
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.redAccent),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          icon: const Icon(Icons.cancel, color: Colors.redAccent),
          label: noLabel,
          onPressed: () {
            Get.back(); // Close the dialog
          },
        ),
      ],
    );
  }
}
