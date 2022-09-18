import 'package:flutter/material.dart';
import 'package:market/helper/nav_helper.dart';
import 'package:market/helper/sp_helper.dart';
import 'package:market/providers/ads_provider.dart';
import 'package:market/providers/auth_provider.dart';
import 'package:market/views/screens/add_new_ad.dart';
import 'package:market/views/screens/auth_screens/enter_phone_screen.dart';
import 'package:market/views/screens/favorate_screen.dart';
import 'package:market/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('My Market'),
              actions: [
                GestureDetector(
                  onTap: () {
                    SPhelper.sPhelper.removePhone();
                    SPhelper.sPhelper.removeToken();
                    NavHelper.navigateWithReplacementToWidget(PhoneScreen());
                  },
                  child: const Icon(Icons.logout),
                )
              ],
              bottom: const TabBar(tabs: [
                Icon(Icons.home),
                Icon(Icons.favorite),
              ])),
          body: TabBarView(children: [HomeScreen(), FavoriteScreen()]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              NavHelper.navigateToWidget(AddNewAd());
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
