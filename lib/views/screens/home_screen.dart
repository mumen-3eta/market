import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:market/providers/ads_provider.dart';
import 'package:market/views/widgets/ad_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, provider, child) {
      return LazyLoadScrollView(
        onEndOfPage: () {
          log(provider.page.toString());
          provider.page += 1;
          provider.getAds();
        },
        child: ListView.builder(
            itemCount: provider.isLoading
                ? provider.ads.length + 1
                : provider.ads.length,
            itemBuilder: (context, index) {
              if (index == provider.ads.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return AdWidget(provider.ads[index]);
            }),
      );
    });
  }
}
