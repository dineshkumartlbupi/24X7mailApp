import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twentyfourby_seven/Utils/Mycolor.dart';
import 'package:twentyfourby_seven/Utils/globalText.dart';

import 'operatorController.dart';

class UploadNewMailScreen extends StatelessWidget {
  UploadNewMailScreen({super.key});
  final OperatorController mailController = Get.put(OperatorController());
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title:
              const GlobalText('Upload New Mail', fontWeight: FontWeight.w600),
          bottom: const TabBar(
            automaticIndicatorColorAdjustment: true,
            tabs: [
              Tab(text: 'Bulk Upload'),
              Tab(text: 'Upload By Customer'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Bulk Upload Tab
            _buildBulkUploadTab(),

            _buildUploadByCustomerTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildBulkUploadTab() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalText(
              '1. Choose Mail Type',
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: Get.height * 0.002),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    hintText: 'Select Mail Type',
                    border: OutlineInputBorder(),
                  ),
                  value: mailController.selectedMailType.value.isEmpty
                      ? null
                      : mailController.selectedMailType.value,
                  onChanged: (String? newValue) {
                    mailController.updateMailType(newValue);
                  },
                  items: mailController.mailTypes
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: GlobalText(value),
                    );
                  }).toList(),
                ),
              );
            }),
            const GlobalText(
              '2. Upload Photo',
              fontWeight: FontWeight.w700,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      await _pickImage();
                    },
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          mailController.selectedImages.isEmpty
                              ? Image.asset(
                                  'assets/images/upload.png',
                                  height: 70,
                                  width: 70,
                                )
                              : Obx(() {
                                  return Wrap(
                                    spacing: 10.0,
                                    runSpacing: 10.0,
                                    children: mailController.selectedImages
                                        .map((file) {
                                      return Stack(
                                        children: [
                                          _buildImagePreview(file),
                                          Positioned(
                                            right: 0,
                                            top: 0,
                                            child: IconButton(
                                              icon: const Icon(Icons.close,
                                                  color: Colors.red),
                                              onPressed: () {
                                                mailController
                                                    .removeImage(file);
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
                                  );
                                }),
                          const SizedBox(height: 10),
                          const Text(
                            'Drag & Drop background image(s) \nor',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              await _pickImage();
                            },
                            child: const GlobalText('Choose file(s)'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Upload Action
                    },
                    child: const GlobalText(
                      'Upload',
                      color: MyColor.cardIColorIndigo,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadByCustomerTab() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                // Add search logic here to filter customer list
                // mailController.searchQuery.value = value;
                // mailController.filterCustomerList();
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.search,
                  color: MyColor.cardIColorIndigo,
                ),
                hintText: 'Mailbox, Customer',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Container(
              height: Get.height * 0.35,
              color: MyColor.deepPurple,
              child: Obx(() => Card(
                    child: ListView.builder(
                      itemCount: mailController.customerList.value.data?.length,
                      itemBuilder: (BuildContext context, int index) => Column(
                        children: [
                          GlobalText(mailController
                                  .customerList.value.data?[index].userType
                                  .toString() ??
                              ''),
                          GlobalText(mailController
                                  .customerList.value.data?[index].lname
                                  .toString() ??
                              ''),
                        ],
                      ),
                    ),
                  )),
            ),

            /* Expanded(
              child: Obx(() => ListView.builder(
                itemCount: mailController.filteredCustomerList.length,
                itemBuilder: (BuildContext context, int index) {
                  var customer = mailController.filteredCustomerList[index];
                  return Card(
                    color: MyColor.yellowGold,
                    child: ListTile(
                      title: GlobalText(customer.userType.toString() ?? ''),
                      subtitle: GlobalText(customer.lname.toString() ?? ''),
                    ),
                  );
                },
              )),
            ),*/
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery); // Picking image from gallery
    if (image != null) {
      mailController.addImage(File(image.path));
    }
  }

  Widget _buildImagePreview(File file) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.file(
        file,
        fit: BoxFit.cover,
      ),
    );
  }
}
