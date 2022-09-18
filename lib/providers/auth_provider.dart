import 'package:flutter/material.dart';
import 'package:market/helper/api_helper.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> phonekey = GlobalKey<FormState>();

  String countryCode = '+9665';

  String? phoneValidator(String? value) {
    if (value == null) {
      return 'phone number is required';
    }
    if (value.length != 8) {
      return 'phone must be 8 numbers';
    }
    return null;
  }

  registerphone() {
    if (phonekey.currentState!.validate()) {
      String phone = countryCode + phoneController.text;
      ApiHelper.apiHelper.registerPhone(phone);
    }
  }

  Future<String?> registerCode() async {
    if (codeController.text.isNotEmpty) {
      String? token =
          await ApiHelper.apiHelper.registerCode(codeController.text);
      return token;
    } else {
      return null;
      print('enter code first');
    }
  }

  resendCode() {
    codeController.clear();
    ApiHelper.apiHelper.resendCode();
  }
}
