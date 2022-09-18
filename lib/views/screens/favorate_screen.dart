import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:market/providers/ads_provider.dart';
import 'package:market/views/widgets/ad_widget.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AdsProvider>(builder: (context, provider, child) {
      return LazyLoadScrollView(
        onEndOfPage: () {
          provider.getMoreFavorites();
        },
        child: ListView.builder(
            itemCount: provider.isLoading
                ? provider.favoritesAds.length + 1
                : provider.favoritesAds.length,
            itemBuilder: (context, index) {
              if (index == provider.favoritesAds.length) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return AdWidget(provider.favoritesAds[index]);
            }),
      );
    });
  }
}
