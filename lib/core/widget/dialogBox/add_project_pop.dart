import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/Input%20Field/custom_test_field_2.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:flutter/material.dart';

Future<Map<String, dynamic>> appProjectsPop() async {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController projectRoleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ValueNotifier<DateTime> startDate =
      ValueNotifier<DateTime>(DateTime.now().subtract(const Duration(days: 1)));
  ValueNotifier<DateTime> endDate = ValueNotifier<DateTime>(DateTime.now());

  DateTime? pickedStartDate =
      await appDatePicker(helpText: "Picked Start Date");

  if (pickedStartDate != null) {
    startDate.value = pickedStartDate;
    startDate.notifyListeners();
  }

  DateTime? pickedEndDate = await appDatePicker(helpText: "Picked End Date");

  if (pickedEndDate != null) {
    endDate.value = pickedEndDate;
    endDate.notifyListeners();
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
                  hintText: "Enter Project Name",
                  label: "Project Name",
                ),
                CustomTestField2(
                  controller: projectRoleController,
                  hintText: "Enter Project Role",
                  label: "Project Role",
                ),
                CustomTestField2(
                  controller: descriptionController,
                  hintText: "Enter Project Description",
                  label: "Project Description",
                  maxLines: 4,
                ),
                ValueListenableBuilder<DateTime>(
                  valueListenable: startDate,
                  builder: (context, startDateValue, child) {
                    return CustomTestField2(
                      hintText: "Start Date",
                      label: "Start Date",
                      showCalendarIcon: true,
                      initialValue:
                          dateFormatter1.format(startDateValue.toLocal()),
                      readOnly: true,
                      onTap: () async {
                        // DateTime? pickedStartDate =
                        //     await appDatePicker(helpText: "Picked Start Date");
                        // if (pickedStartDate != null) {
                        //   startDate.value = pickedStartDate;
                        //   startDate.notifyListeners();
                        // }
                      },
                    );
                  },
                ),
                ValueListenableBuilder<DateTime>(
                  valueListenable: endDate,
                  builder: (context, endDateValue, child) {
                    return CustomTestField2(
                      hintText: "End Date",
                      label: "End Date",
                      showCalendarIcon: true,
                      initialValue:
                          dateFormatter1.format(endDateValue.toLocal()),
                      readOnly: true,
                      onTap: () async {
                        // DateTime? pickedEndDate =
                        //     await appDatePicker(helpText: "Picked End Date");
                        // if (pickedEndDate != null) {
                        //   endDate.value = pickedEndDate;
                        //   endDate.notifyListeners();
                        // }
                      },
                    );
                  },
                ),
                const SizedBox(height: 10),
                AppButton(
                    label: "Submit",
                    onPressed: () {
                      Navigator.of(context).pop(projectNameController.text != ""
                          ? {
                              'name': projectNameController.text,
                              'role': projectRoleController.text,
                              'description': descriptionController.text,
                              'startDate': startDate,
                              'endDate': endDate,
                            }
                          : {});
                    })
              ],
            ),
          ),
        ),
      );
    },
  );
}
