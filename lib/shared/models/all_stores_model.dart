class StoreModel {
  StoreModel({
    required this.id,
    required this.storeName,
    required this.ownerName,
    required this.mobile,
    required this.ownerIdentity,
    required this.email,
    required this.bio,
    required this.avatarImg,
    required this.verify,
    required this.accountStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.completed,
    required this.closeStore,
    required this.typeCategory,
    required this.storeCredential,
    required this.storeBanks,
    required this.authorities,
    required this.city,
    required this.storeCategories,
    required this.messageComplete,
  });
  int? id;
  String? storeName;
  String? ownerName;
  String? mobile;
  String? ownerIdentity;
  String? email;
  String? bio;
  String? avatarImg;
  bool? verify;
  String? accountStatus;
  String? createdAt;
  String? updatedAt;
  bool? completed;
  bool? closeStore;
  TypeCategory? typeCategory;
  StoreCredential? storeCredential;
  StoreBanks? storeBanks;
  Authorities? authorities;
  City? city;
  List<StoreCategories>? storeCategories;
  List<dynamic>? messageComplete;

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeName = json['store_name'];
    ownerName = json['owner_name'];
    mobile = json['mobile'];
    ownerIdentity = json['owner_identity'];
    email = json['email'];
    bio = json['bio'];
    avatarImg = json['avatar_img'];
    verify = json['verify'];
    accountStatus = json['account_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    completed = json['completed'];
    closeStore = json['close_store'];
    typeCategory = TypeCategory.fromJson(json['type_category']);
    storeCredential = StoreCredential.fromJson(json['store_credential']);
    storeBanks = StoreBanks.fromJson(json['store_banks']);
    authorities = Authorities.fromJson(json['authorities']);
    city = City.fromJson(json['city']);
    storeCategories = List.from(
      json['store_categories'],
    ).map((e) => StoreCategories.fromJson(e)).toList();
    messageComplete = List.castFrom<dynamic, dynamic>(json['message_complete']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['store_name'] = storeName;
    _data['owner_name'] = ownerName;
    _data['mobile'] = mobile;
    _data['owner_identity'] = ownerIdentity;
    _data['email'] = email;
    _data['bio'] = bio;
    _data['avatar_img'] = avatarImg;
    _data['verify'] = verify;
    _data['account_status'] = accountStatus;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['completed'] = completed;
    _data['close_store'] = closeStore;
    _data['type_category'] = typeCategory?.toJson();
    _data['store_credential'] = storeCredential?.toJson();
    _data['store_banks'] = storeBanks?.toJson();
    _data['authorities'] = authorities?.toJson();
    _data['city'] = city?.toJson();
    _data['store_categories'] = storeCategories
        ?.map((e) => e.toJson())
        .toList();
    _data['message_complete'] = messageComplete;
    return _data;
  }
}

class TypeCategory {
  TypeCategory({required this.reference, required this.ar, required this.en});
  String? reference;
  String? ar;
  String? en;

  TypeCategory.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['reference'] = reference;
    _data['ar'] = ar;
    _data['en'] = en;
    return _data;
  }
}

class StoreCredential {
  StoreCredential({
    required this.storeId,
    required this.businessName,
    required this.businessPurpose,
    required this.entityType,
    required this.crNumber,
    required this.taxNumber,
    required this.nameFreelance,
    required this.numberFreelance,
    required this.issueDateFreelance,
    required this.expiryDateFreelance,
  });
  int? storeId;
  String? businessName;
  String? businessPurpose;
  String? entityType;
  String? crNumber;
  String? taxNumber;
  String? nameFreelance;
  String? numberFreelance;
  String? issueDateFreelance;
  String? expiryDateFreelance;

  StoreCredential.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    businessName = json['business_name'];
    businessPurpose = json['business_purpose'];
    entityType = json['entity_type'];
    crNumber = json['cr_number'];
    taxNumber = json['tax_number'];
    nameFreelance = json['name_freelance'];
    numberFreelance = json['number_freelance'];
    issueDateFreelance = json['issue_date_freelance'];
    expiryDateFreelance = json['expiry_date_freelance'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['store_id'] = storeId;
    _data['business_name'] = businessName;
    _data['business_purpose'] = businessPurpose;
    _data['entity_type'] = entityType;
    _data['cr_number'] = crNumber;
    _data['tax_number'] = taxNumber;
    _data['name_freelance'] = nameFreelance;
    _data['number_freelance'] = numberFreelance;
    _data['issue_date_freelance'] = issueDateFreelance;
    _data['expiry_date_freelance'] = expiryDateFreelance;
    return _data;
  }
}

class StoreBanks {
  StoreBanks({
    required this.iban,
    required this.storeId,
    required this.bankAr,
    required this.bankEn,
    required this.accountName,
  });
  String? iban;
  int? storeId;
  String? bankAr;
  String? bankEn;
  String? accountName;

  StoreBanks.fromJson(Map<String, dynamic> json) {
    iban = json['iban'];
    storeId = json['store_id'];
    bankAr = json['bank_ar'];
    bankEn = json['bank_en'];
    accountName = json['account_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['iban'] = iban;
    _data['store_id'] = storeId;
    _data['bank_ar'] = bankAr;
    _data['bank_en'] = bankEn;
    _data['account_name'] = accountName;
    return _data;
  }
}

class Authorities {
  Authorities({required this.reference, required this.ar, required this.en});
  String? reference;
  String? ar;
  String? en;

  Authorities.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['reference'] = reference;
    _data['ar'] = ar;
    _data['en'] = en;
    return _data;
  }
}

class City {
  City({
    required this.regionId,
    required this.cityId,
    required this.cityAr,
    required this.cityEn,
    required this.regionAr,
    required this.regionEn,
    required this.longitude,
    required this.latitude,
    required this.locationText,
  });
  String? regionId;
  String? cityId;
  String? cityAr;
  String? cityEn;
  String? regionAr;
  String? regionEn;
  double? longitude;
  double? latitude;
  String? locationText;

  City.fromJson(Map<String, dynamic> json) {
    regionId = json['region_id'];
    cityId = json['city_id'];
    cityAr = json['city_ar'];
    cityEn = json['city_en'];
    regionAr = json['region_ar'];
    regionEn = json['region_en'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    locationText = json['locationText'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['region_id'] = regionId;
    _data['city_id'] = cityId;
    _data['city_ar'] = cityAr;
    _data['city_en'] = cityEn;
    _data['region_ar'] = regionAr;
    _data['region_en'] = regionEn;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    _data['locationText'] = locationText;
    return _data;
  }
}

class StoreCategories {
  StoreCategories({
    required this.ar,
    required this.en,
    required this.id,
    required this.storeId,
  });
  String? ar;
  String? en;
  String? id;
  int? storeId;

  StoreCategories.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
    id = json['id'];
    storeId = json['store_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ar'] = ar;
    _data['en'] = en;
    _data['id'] = id;
    _data['store_id'] = storeId;
    return _data;
  }
}
