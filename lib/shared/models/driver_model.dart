class DriverModel {
  DriverModel({
    required this.id,
    required this.authId,
    required this.completed,
    required this.referenceCode,
    this.deleteAt,
    this.registrationDate,
    required this.personInfo,
    required this.carInfo,
    required this.address,
    required this.company,
  });
  String? id;
  String? authId;
  bool? completed;
  String? referenceCode;
  String? deleteAt;
  String? registrationDate;
  PersonInfo? personInfo;
  CarInfo? carInfo;
  Address? address;
  Company? company;

  DriverModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authId = json['auth_id'];
    completed = json['completed'];
    referenceCode = json['reference_code'];
    deleteAt = json['delete_at'];
    registrationDate = json['registration_date'];
    personInfo = PersonInfo.fromJson(json['person_info'] ?? {});
    carInfo = CarInfo.fromJson(json['car_info'] ?? {});
    address = Address.fromJson(json['address'] ?? {});
    company = Company.fromJson(json['company'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['auth_id'] = authId;
    _data['completed'] = completed;
    _data['reference_code'] = referenceCode;
    _data['delete_at'] = deleteAt;
    _data['registration_date'] = registrationDate;
    _data['person_info'] = personInfo?.toJson();
    _data['car_info'] = carInfo?.toJson();
    _data['address'] = address?.toJson();
    _data['company'] = company?.toJson();
    return _data;
  }
}

class PersonInfo {
  PersonInfo({
    required this.name,
    required this.birthDay,
    required this.mobile,
    this.email,
    required this.nationality,
    required this.imageUrl,
    required this.identity,
  });
  String? name;
  String? birthDay;
  String? mobile;
  String? email;
  String? nationality;
  String? imageUrl;
  Identity? identity;

  PersonInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthDay = json['birth_day'];
    mobile = json['mobile'];
    email = json['email'];
    nationality = json['nationality'];
    imageUrl = json['image_url'];
    identity = Identity.fromJson(json['identity'] ?? {});
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['birth_day'] = birthDay;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['nationality'] = nationality;
    _data['image_url'] = imageUrl;
    _data['identity'] = identity?.toJson();
    return _data;
  }
}

class Identity {
  Identity({required this.ar, required this.en, required this.idNumber});
  String? ar;
  String? en;
  String? idNumber;

  Identity.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
    idNumber = json['id_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ar'] = ar;
    _data['en'] = en;
    _data['id_number'] = idNumber;
    return _data;
  }
}

class CarInfo {
  CarInfo({
    required this.ar,
    required this.en,
    required this.vehicleSequenceNumber,
    required this.carNumber,
  });
  String? ar;
  String? en;
  String? vehicleSequenceNumber;
  String? carNumber;

  CarInfo.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
    vehicleSequenceNumber = json['vehicle_sequence_number'];
    carNumber = json['car_number'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ar'] = ar;
    _data['en'] = en;
    _data['vehicle_sequence_number'] = vehicleSequenceNumber;
    _data['car_number'] = carNumber;
    return _data;
  }
}

class Address {
  Address({
    required this.cityAr,
    required this.cityEn,
    required this.cityId,
    required this.regionAr,
    required this.regionEn,
  });
  String? cityAr;
  String? cityEn;
  String? cityId;
  String? regionAr;
  String? regionEn;

  Address.fromJson(Map<String, dynamic> json) {
    cityAr = json['city_ar'];
    cityEn = json['city_en'];
    cityId = json['city_id'];
    regionAr = json['region_ar'];
    regionEn = json['region_en'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['city_ar'] = cityAr;
    _data['city_en'] = cityEn;
    _data['city_id'] = cityId;
    _data['region_ar'] = regionAr;
    _data['region_en'] = regionEn;
    return _data;
  }
}

class Company {
  Company({
    required this.id,
    required this.email,
    required this.mobile,
    required this.authId,
    required this.logoUrl,
    required this.createdAt,
    required this.companyName,
    this.commercialId,
    this.establishmentId,
  });
  String? id;
  String? email;
  String? mobile;
  String? authId;
  String? logoUrl;
  String? createdAt;
  String? companyName;
  String? commercialId;
  String? establishmentId;

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    mobile = json['mobile'];
    authId = json['auth_id'];
    logoUrl = json['logo_url'];
    createdAt = json['created_at'];
    companyName = json['company_name'];
    commercialId = json['commercial_id'];
    establishmentId = json['establishment_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['email'] = email;
    _data['mobile'] = mobile;
    _data['auth_id'] = authId;
    _data['logo_url'] = logoUrl;
    _data['created_at'] = createdAt;
    _data['company_name'] = companyName;
    _data['commercial_id'] = commercialId;
    _data['establishment_id'] = establishmentId;
    return _data;
  }
}
