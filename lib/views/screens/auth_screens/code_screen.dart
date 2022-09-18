import 'package:flutter/material.dart';
import 'package:market/helper/nav_helper.dart';
import 'package:market/providers/ads_provider.dart';
import 'package:market/providers/auth_provider.dart';
import 'package:market/views/screens/main_screen.dart';
import 'package:provider/provider.dart';

class CodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProvider, AdsProvider>(
        builder: (context, authProvider, adsProvider, child) {
      return WillPopScope(
        onWillPop: () async {
          authProvider.codeController.clear();
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Verification code'),
          ),
          body: SingleChildScrollView(
              child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: authProvider.codeController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.withOpacity(0.2),
                      label: const Text('verification code'),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20))),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          String? token = await authProvider.registerCode();
                          if (token == null) {
                          } else {
                            adsProvider.getAds();
                            NavHelper.navigateWithReplacementToWidget(
                                MainScreen());
                          }
                        },
                        child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: const Text('verify code'))),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          authProvider.resendCode();
                        },
                        child: const Text('resend code')),
                  ],
                )
              ],
            ),
          )),
        ),
      );
    });
  }
}
