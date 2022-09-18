class LoginResponse {
  bool? success;
  Data? dta;
  int? status;
  String? message;

  LoginResponse({this.success, this.dta, this.status, this.message});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    dta = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (dta != null) {
      data['data'] = dta!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  int? adsNumber;
  int? buysNumber;
  bool? isRegistered;
  String? username;
  String? image;
  String? phone;
  String? email;
  bool? verified;
  int? gender;
  String? genderName;
  String? code;
  String? lat;
  String? lng;
  String? dob;
  bool? showPhoneNumber;
  String? createdAt;
  String? local;
  bool? notification;
  int? unreadNotifications;
  Rate? rate;
  String? accessToken;
  int? city;
  int? country;

  Data(
      {this.id,
      this.name,
      this.adsNumber,
      this.buysNumber,
      this.isRegistered,
      this.username,
      this.image,
      this.phone,
      this.email,
      this.verified,
      this.gender,
      this.genderName,
      this.code,
      this.lat,
      this.lng,
      this.dob,
      this.showPhoneNumber,
      this.createdAt,
      this.local,
      this.notification,
      this.unreadNotifications,
      this.rate,
      this.accessToken,
      this.city,
      this.country});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    adsNumber = json['ads_number'];
    buysNumber = json['buys_number'];
    isRegistered = json['is_registered'];
    username = json['username'];
    image = json['image'];
    phone = json['phone'];
    email = json['email'];
    verified = json['verified'];
    gender = json['gender'];
    genderName = json['gender_name'];
    code = json['code'];
    lat = json['lat'];
    lng = json['lng'];
    dob = json['dob'];
    showPhoneNumber = json['show_phone_number'];
    createdAt = json['created_at'];
    local = json['local'];
    notification = json['notification'];
    unreadNotifications = json['unread_notifications'];
    rate = json['rate'] != null ? Rate.fromJson(json['rate']) : null;
    accessToken = json['access_token'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['ads_number'] = adsNumber;
    data['buys_number'] = buysNumber;
    data['is_registered'] = isRegistered;
    data['username'] = username;
    data['image'] = image;
    data['phone'] = phone;
    data['email'] = email;
    data['verified'] = verified;
    data['gender'] = gender;
    data['gender_name'] = genderName;
    data['code'] = code;
    data['lat'] = lat;
    data['lng'] = lng;
    data['dob'] = dob;
    data['show_phone_number'] = showPhoneNumber;
    data['created_at'] = createdAt;
    data['local'] = local;
    data['notification'] = notification;
    data['unread_notifications'] = unreadNotifications;
    if (rate != null) {
      data['rate'] = rate!.toJson();
    }
    data['access_token'] = accessToken;
    data['city'] = city;
    data['country'] = country;
    return data;
  }
}

class Rate {
  int? avgRate;
  int? totalRantingsNumber;
  RantingNumbers? rantingNumbers;

  Rate({this.avgRate, this.totalRantingsNumber, this.rantingNumbers});

  Rate.fromJson(Map<String, dynamic> json) {
    avgRate = json['avg_rate'];
    totalRantingsNumber = json['total_rantings_number'];
    rantingNumbers = json['ranting_numbers'] != null
        ? RantingNumbers.fromJson(json['ranting_numbers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avg_rate'] = avgRate;
    data['total_rantings_number'] = totalRantingsNumber;
    if (rantingNumbers != null) {
      data['ranting_numbers'] = rantingNumbers!.toJson();
    }
    return data;
  }
}

class RantingNumbers {
  int? first;
  int? second;
  int? third;
  int? fourth;
  int? fifth;

  RantingNumbers(
      {this.first, this.second, this.third, this.fourth, this.fifth});

  RantingNumbers.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
    third = json['third'];
    fourth = json['fourth'];
    fifth = json['fifth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['second'] = second;
    data['third'] = third;
    data['fourth'] = fourth;
    data['fifth'] = fifth;
    return data;
  }
}
