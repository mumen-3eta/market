import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:market/helper/nav_helper.dart';
import 'package:market/helper/sp_helper.dart';
import 'package:market/models/ad_response_model.dart';
import 'package:market/models/add_ad_response_model.dart';
import 'package:market/models/login_response_model.dart';
import 'package:market/models/verified_code_response_model.dart';
import 'package:market/views/screens/auth_screens/code_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiHelper {
  ApiHelper._();
  static ApiHelper apiHelper = ApiHelper._();
  Dio dio = Dio();
  final String _apiLink = 'https://6594-158-140-111-47.ngrok.io';

  registerPhone(String phone) async {
    SPhelper.sPhelper.savePhone(phone);
    Response response =
        await dio.post('$_apiLink/api/v1/login', data: {'phone': phone});
    LoginResponse loginResponse = LoginResponse.fromJson(response.data);
    if (loginResponse.success!) {
      NavHelper.navigateToWidget(CodeScreen());
      String massege =
          'Your market app verification code is: ${loginResponse.dta!.code!}';
      openWhatsApp(massege);
    }
  }

  Future<String?> registerCode(String code) async {
    String? phone = SPhelper.sPhelper.getPhone();
    Response response = await dio.post('$_apiLink/api/v1/verified_code',
        data: {'code': code, 'phone': phone});
    VerifiedCodeResponse verifiedCodeResponse =
        VerifiedCodeResponse.fromJson(response.data);
    if (verifiedCodeResponse.success!) {
      String token = verifiedCodeResponse.data!.accessToken!;
      SPhelper.sPhelper.saveToken(token);
      return token;
    }
    return null;
  }

  resendCode() async {
    String? phone = SPhelper.sPhelper.getPhone();
    Response response =
        await dio.post('$_apiLink/api/v1/resendCode', data: {'phone': phone});
    LoginResponse loginResponse = LoginResponse.fromJson(response.data);
    if (loginResponse.success!) {
      String massege =
          'Your market app verification code is: ${loginResponse.dta!.code!}';
      openWhatsApp(massege);
    }
  }

  Future<List<Items>> getAds(int page) async {
    Response response = await dio.get(
      '$_apiLink/api/v1/ads',
      queryParameters: {'page': page},
    );
    AddResponse addResponse = AddResponse.fromJson(response.data);

    if (addResponse.success!) {
      return addResponse.dta!.items!;
    }
    return [];
  }

  Future<List<Items>> getFavoriteAds(int page) async {
    String token = SPhelper.sPhelper.getToken()!;
    Response response = await dio.get(
      '$_apiLink/api/v1/user/favorites',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      queryParameters: {'page': page},
    );
    AddResponse addResponse = AddResponse.fromJson(response.data);
    if (addResponse.success!) {
      return addResponse.dta!.items!;
    }
    return [];
  }

  Future<Items> addToVavorites(int id) async {
    String token = SPhelper.sPhelper.getToken()!;
    Response response = await dio.post(
      '$_apiLink/api/v1/user/favorite/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    Items item = Items.fromJson(response.data);
    return item;
  }

  publishAd(String details, int price, File file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    String json = jsonEncode(formData);
    Response response = await dio.post('$_apiLink/api/v1/ad',
        data: {
          'category_id': '1',
          'stakeholder_id': '1',
          'title': 'مصعب',
          'details': details,
          'price_type': '1',
          'price': price,
          'show_phone_number': '1',
          'argent_ad': '1',
          'show_location': '1',
          'ad_type': '1',
          'car_model_id': '1',
          'fuel_type_id': '1',
          'km': '1',
          'gear_type_id': '1',
          'city_id': '1',
          'car_type_id': '1',
          'car_brand_id': '1',
          'car_status': '1',
          'images[0]': json
        },
        options: Options(contentType: 'multipart/form-data'));
    AddAdResponse addAdResponse = AddAdResponse.fromJson(response.data);
    log(addAdResponse.success.toString());
  }

  getCities() async {
    Response response = await dio.get('$_apiLink/api/v1/cities');
    log(response.data);
  }

  openWhatsApp(String massege) async {
    String whatsApp =
        "whatsapp://send?phone=970567773655&text=${Uri.encodeFull(massege)}";
    {
      launchUrl(
        Uri.parse(whatsApp),
      );
    }
  }
}
