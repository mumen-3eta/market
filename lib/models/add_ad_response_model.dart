class AddAdResponse {
  bool? success;
  Data? dta;
  int? status;
  String? message;

  AddAdResponse({this.success, this.dta, this.status, this.message});

  AddAdResponse.fromJson(Map<String, dynamic> json) {
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
  String? deepLink;
  int? rate;
  int? priceType;
  int? ownerType;
  String? adType;
  String? carStatus;
  int? orderId;
  int? orderUuid;
  bool? isCheckout;
  int? views;
  int? price;
  String? image;
  String? details;
  bool? showPhoneNumber;
  bool? showLocation;
  bool? argentAd;
  String? title;
  String? sold;
  String? address;
  double? lat;
  double? lng;
  bool? featured;
  String? createdAt;
  bool? favorited;
  int? km;
  String? chat;
  FuelType? fuelType;
  FuelType? carModel;
  Owner? owner;
  FuelType? city;
  FuelType? stakeholder;
  Category? category;
  List<Images>? images;
  FuelType? gearType;

  Data(
      {this.id,
      this.deepLink,
      this.rate,
      this.priceType,
      this.ownerType,
      this.adType,
      this.carStatus,
      this.orderId,
      this.orderUuid,
      this.isCheckout,
      this.views,
      this.price,
      this.image,
      this.details,
      this.showPhoneNumber,
      this.showLocation,
      this.argentAd,
      this.title,
      this.sold,
      this.address,
      this.lat,
      this.lng,
      this.featured,
      this.createdAt,
      this.favorited,
      this.km,
      this.chat,
      this.fuelType,
      this.carModel,
      this.owner,
      this.city,
      this.stakeholder,
      this.category,
      this.images,
      this.gearType});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deepLink = json['deep_link'];
    rate = json['rate'];
    priceType = json['price_type'];
    ownerType = json['owner_type'];
    adType = json['ad_type'];
    carStatus = json['car_status'];
    orderId = json['order_id'];
    orderUuid = json['order_uuid'];
    isCheckout = json['is_checkout'];
    views = json['views'];
    price = json['price'];
    image = json['image'];
    details = json['details'];
    showPhoneNumber = json['show_phone_number'];
    showLocation = json['show_location'];
    argentAd = json['argent_ad'];
    title = json['title'];
    sold = json['sold'];
    address = json['address'];
    lat = json['lat'];
    lng = json['lng'];
    featured = json['featured'];
    createdAt = json['created_at'];
    favorited = json['favorited'];
    km = json['km'];
    chat = json['chat'];
    fuelType =
        json['fuel_type'] != null ? FuelType.fromJson(json['fuel_type']) : null;
    carModel =
        json['car_model'] != null ? FuelType.fromJson(json['car_model']) : null;
    owner = json['owner'] != null ? Owner.fromJson(json['owner']) : null;
    city = json['city'] != null ? FuelType.fromJson(json['city']) : null;
    stakeholder = json['stakeholder'] != null
        ? FuelType.fromJson(json['stakeholder'])
        : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    gearType =
        json['gear_type'] != null ? FuelType.fromJson(json['gear_type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['deep_link'] = deepLink;
    data['rate'] = rate;
    data['price_type'] = priceType;
    data['owner_type'] = ownerType;
    data['ad_type'] = adType;
    data['car_status'] = carStatus;
    data['order_id'] = orderId;
    data['order_uuid'] = orderUuid;
    data['is_checkout'] = isCheckout;
    data['views'] = views;
    data['price'] = price;
    data['image'] = image;
    data['details'] = details;
    data['show_phone_number'] = showPhoneNumber;
    data['show_location'] = showLocation;
    data['argent_ad'] = argentAd;
    data['title'] = title;
    data['sold'] = sold;
    data['address'] = address;
    data['lat'] = lat;
    data['lng'] = lng;
    data['featured'] = featured;
    data['created_at'] = createdAt;
    data['favorited'] = favorited;
    data['km'] = km;
    data['chat'] = chat;
    if (fuelType != null) {
      data['fuel_type'] = fuelType!.toJson();
    }
    if (carModel != null) {
      data['car_model'] = carModel!.toJson();
    }
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (stakeholder != null) {
      data['stakeholder'] = stakeholder!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (gearType != null) {
      data['gear_type'] = gearType!.toJson();
    }
    return data;
  }
}

class FuelType {
  int? id;
  String? name;

  FuelType({this.id, this.name});

  FuelType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Owner {
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

  Owner(
      {id,
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

  Owner.fromJson(Map<String, dynamic> json) {
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

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class Images {
  int? id;
  String? image;

  Images({this.id, this.image});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}
