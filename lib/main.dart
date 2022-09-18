import 'package:flutter/material.dart';
import 'package:market/helper/nav_helper.dart';
import 'package:market/helper/sp_helper.dart';
import 'package:market/providers/ads_provider.dart';
import 'package:market/providers/auth_provider.dart';
import 'package:market/views/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SPhelper.sPhelper.inisit();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<AdsProvider>(create: (context) => AdsProvider()),
      ],
      child: MaterialApp(
        navigatorKey: NavHelper.navkey,
        home: SplashScreen(),
      ),
    );
  }
}
