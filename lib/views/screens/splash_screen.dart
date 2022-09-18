import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:market/helper/nav_helper.dart';
import 'package:market/helper/sp_helper.dart';
import 'package:market/providers/ads_provider.dart';
import 'package:market/views/screens/auth_screens/enter_phone_screen.dart';
import 'package:market/views/screens/main_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  initSplash(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    if (SPhelper.sPhelper.getToken() != null) {
      Provider.of<AdsProvider>(context, listen: false).getAds();
      NavHelper.navigateWithReplacementToWidget(MainScreen());
    } else {
      NavHelper.navigateWithReplacementToWidget(PhoneScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    initSplash(context);
    return Scaffold(
        body: Center(
      child: Lottie.asset('assets/animations/splash.json'),
    ));
  }
}
