import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/theme_constants.dart';
import '../../../../../core/utils/utils_methods.dart';
import '../../../../../core/widget/Input Field/custom_test_field_2.dart';

Future<Map<String, dynamic>> appProjectsPop() async {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectRoleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  DateTime? pickedStartDate =
      await appDatePicker(helpText: "Picked Start Date");

  if (pickedStartDate != null) {
    startDate = pickedStartDate;
  }

  DateTime? pickedEndDate = await appDatePicker(helpText: "Picked End Date");

  if (pickedEndDate != null) {
    endDate = pickedEndDate;
  }

  return await showDialog(
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return FittedBox(
        child: SizedBox(
          width: width,
          child: AlertDialog(
            contentPadding: const EdgeInsets.all(15),
            shape: appDialogBoxBorder,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Add Projects', style: TextHelper.h8),
                const CloseButton()
              ],
            ),
            content: Column(
              children: [
                CustomTestField2(
                  controller: projectNameController,
                  hintText: "Project Name",
                ),
                CustomTestField2(
                  controller: projectRoleController,
                  hintText: "Project Role",
                ),
                CustomTestField2(
                  controller: descriptionController,
                  hintText: "Project Description",
                  maxLines: 4,
                ),
                CustomTestField2(
                  hintText: "Start Date",
                  initialValue: dateFormatter1.format(startDate.toLocal()),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedStartDate = await appDatePicker();
                    if (pickedStartDate != null) {
                      startDate = pickedStartDate;
                    }
                  },
                ),
                CustomTestField2(
                  hintText: "End Date",
                  initialValue: dateFormatter1.format(endDate.toLocal()),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedEndDate = await appDatePicker();

                    if (pickedEndDate != null) {
                      endDate = pickedEndDate;
                    }
                  },
                ),
                const SizedBox(height: 10),
                AppButton(
                    label: "Submit",
                    onPressed: () {
                      Navigator.of(context).pop({
                        'name': projectNameController.text,
                        'role': projectRoleController.text,
                        'description': descriptionController.text,
                        'startDate': startDate,
                        'endDate': endDate,
                      });
                    })
              ],
            ),
          ),
        ),
      );
    },
  );
}
