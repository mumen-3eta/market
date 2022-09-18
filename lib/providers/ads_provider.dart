import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:market/helper/api_helper.dart';
import 'package:market/models/ad_response_model.dart';

class AdsProvider extends ChangeNotifier {
  List<Items> ads = [];
  int page = 1;
  bool isLoading = false;

  List<Items> favoritesAds = [];
  int favoritePage = 0;

  getMoreAds() async {
    ++page;
    getAds();
    log(page.toString());
  }

  getAds() async {
    isLoading = true;
    notifyListeners();
    List<Items> items = await ApiHelper.apiHelper.getAds(page);
    ads.addAll(items);
    isLoading = false;
    notifyListeners();
  }

  getFavoriteAds() async {
    isLoading = true;
    notifyListeners();
    List<Items> items = await ApiHelper.apiHelper.getFavoriteAds(favoritePage);
    favoritesAds.addAll(items);
    isLoading = false;
    notifyListeners();
  }

  getMoreFavorites() async {
    favoritePage++;
    getFavoriteAds();
  }

  addToFavorite(int id) async {
    Items item = await ApiHelper.apiHelper.addToVavorites(id);
    if (item.favorited!) {
      favoritesAds.add(item);
      notifyListeners();
    } else {
      favoritesAds.removeWhere((element) => element.id! == item.id);
      notifyListeners();
    }
  }

  TextEditingController contentController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  GlobalKey<FormState> adkey = GlobalKey<FormState>();

  String? fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    }
    return null;
  }

  File? selectedImage;

  selectImage() async {
    XFile? xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(xfile!.path);
    notifyListeners();
  }

  publishAd(
    String details,
    int price,
  ) async {
    if (adkey.currentState!.validate()) {
      if (selectedImage == null) {
        SnackBar snackBar = const SnackBar(
          content: Text('ad photo is required'),
          duration: Duration(seconds: 2),
        );
        ScaffoldMessenger.of(adkey.currentContext!).showSnackBar(snackBar);
      } else {
        await ApiHelper.apiHelper.publishAd(details, price, selectedImage!);
      }
    }
  }
}
