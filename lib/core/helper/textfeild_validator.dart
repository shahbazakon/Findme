import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TextFieldValidator {
  AppLocalizations? translate =
      AppLocalizations.of(navigatorKey.currentContext!);
  String? validateNullField(value, String fieldName) {
    if (value == null || value.toString().trim().isEmpty) {
      return "$fieldName ${translate!.isRequired}";
    } else {
      return null;
    }
  }

  String? validateEmail(name) {
    String pattern1 = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    bool emailValid = RegExp(pattern1).hasMatch(name);
    if (emailValid) {
      return null;
    } else {
      return translate!.pleaseEnterAValidEmailId;
    }
  }

  String? validateStrongPassword(password, {bool showValidationMsg = true}) {
    bool isPasswordStrong =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[^\w\d\s]).{8,}$')
            .hasMatch(password);
    if (isPasswordStrong) {
      return null;
    } else {
      return showValidationMsg ? translate!.strongPasswordMsg : "";
    }
  }

  String? validateDate(date) {
    String date_format = r"^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$";
    bool emailValid = RegExp(date_format).hasMatch(date);
    if (emailValid) {
      return null;
    } else {
      return translate!.invalidDateFormat;
    }
  }

  String? validatePhone(name) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (name.length == 0) {
      return translate!.pleaseEnterPhoneNumber;
    } else if (!regExp.hasMatch(name)) {
      return translate!.pleaseEnterAValidEmailId;
    }
  }
}
