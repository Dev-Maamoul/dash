class OrdersModel {
  OrdersModel({
    required this.id,
    required this.total,
    required this.totalWithoutDelivery,
    required this.vat,
    required this.vatPercentage,
    required this.price,
    required this.driverIncome,
    required this.deliveryPrice,
    this.coupon,
    required this.couponPercentage,
    required this.couponDiscount,
    required this.distance,
    required this.preparationTime,
    required this.createdAt,
    this.deletedAt,
    required this.textLocationOrder,
    required this.timeDelivery,
    required this.dateDelivery,
    required this.status,
    required this.products,
    required this.history,
    required this.address,
    required this.store,
    required this.user,
  });
  late final String id;
  late final double total;
  late final double totalWithoutDelivery;
  late final double vat;
  late final String vatPercentage;
  late final int price;
  late final double driverIncome;
  late final int deliveryPrice;
  late final Null coupon;
  late final String couponPercentage;
  late final int couponDiscount;
  late final double distance;
  late final int preparationTime;
  late final String createdAt;
  late final Null deletedAt;
  late final String textLocationOrder;
  late final String timeDelivery;
  late final String dateDelivery;
  late final String status;
  late final List<Products> products;
  late final List<History> history;
  late final Address address;
  late final Store store;
  late final User user;

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    totalWithoutDelivery = json['total_without_delivery'];
    vat = json['vat'];
    vatPercentage = json['vat_percentage'];
    price = json['price'];
    driverIncome = json['driver_income'];
    deliveryPrice = json['delivery_price'];
    coupon = null;
    couponPercentage = json['coupon_percentage'];
    couponDiscount = json['coupon_discount'];
    distance = json['distance'];
    preparationTime = json['preparation_time'];
    createdAt = json['created_at'];
    deletedAt = null;
    textLocationOrder = json['text_location_order'];
    timeDelivery = json['time_delivery'];
    dateDelivery = json['date_delivery'];
    status = json['status'];
    products = List.from(
      json['products'],
    ).map((e) => Products.fromJson(e)).toList();
    history = List.from(
      json['history'],
    ).map((e) => History.fromJson(e)).toList();
    address = Address.fromJson(json['address']);
    store = Store.fromJson(json['store']);
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['total'] = total;
    _data['total_without_delivery'] = totalWithoutDelivery;
    _data['vat'] = vat;
    _data['vat_percentage'] = vatPercentage;
    _data['price'] = price;
    _data['driver_income'] = driverIncome;
    _data['delivery_price'] = deliveryPrice;
    _data['coupon'] = coupon;
    _data['coupon_percentage'] = couponPercentage;
    _data['coupon_discount'] = couponDiscount;
    _data['distance'] = distance;
    _data['preparation_time'] = preparationTime;
    _data['created_at'] = createdAt;
    _data['deleted_at'] = deletedAt;
    _data['text_location_order'] = textLocationOrder;
    _data['time_delivery'] = timeDelivery;
    _data['date_delivery'] = dateDelivery;
    _data['status'] = status;
    _data['products'] = products.map((e) => e.toJson()).toList();
    _data['history'] = history.map((e) => e.toJson()).toList();
    _data['address'] = address.toJson();
    _data['store'] = store.toJson();
    _data['user'] = user.toJson();
    return _data;
  }
}

class Products {
  Products({
    required this.id,
    required this.gift,
    required this.name,
    required this.color,
    required this.count,
    required this.price,
    required this.total,
    required this.idSize,
    required this.discount,
    required this.orderId,
    required this.imageUrl,
    required this.percentage,
    required this.productId,
    required this.titleSize,
    required this.optionsPrice,
    required this.options,
  });
  late final int id;
  late final bool gift;
  late final String name;
  late final String color;
  late final int count;
  late final double price;
  late final double total;
  late final String idSize;
  late final double discount;
  late final String orderId;
  late final String imageUrl;
  late final String percentage;
  late final String productId;
  late final String titleSize;
  late final double optionsPrice;
  late final List<Options> options;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gift = json['gift'];
    name = json['name'];
    color = json['color'];
    count = json['count'];
    price = json['price'];
    total = json['total'];
    idSize = json['id_size'];
    discount = json['discount'];
    orderId = json['order_id'];
    imageUrl = json['image_url'];
    percentage = json['percentage'];
    productId = json['product_id'];
    titleSize = json['title_size'];
    optionsPrice = json['options_price'];
    options = List.from(
      json['options'],
    ).map((e) => Options.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['gift'] = gift;
    _data['name'] = name;
    _data['color'] = color;
    _data['count'] = count;
    _data['price'] = price;
    _data['total'] = total;
    _data['id_size'] = idSize;
    _data['discount'] = discount;
    _data['order_id'] = orderId;
    _data['image_url'] = imageUrl;
    _data['percentage'] = percentage;
    _data['product_id'] = productId;
    _data['title_size'] = titleSize;
    _data['options_price'] = optionsPrice;
    _data['options'] = options.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Options {
  Options({required this.id, required this.price, required this.title});
  late final String id;
  late final int price;
  late final String title;

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['price'] = price;
    _data['title'] = title;
    return _data;
  }
}

class History {
  History({required this.by, required this.status, required this.createAt});
  late final String by;
  late final String status;
  late final String createAt;

  History.fromJson(Map<String, dynamic> json) {
    by = json['by'];
    status = json['status'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['by'] = by;
    _data['status'] = status;
    _data['create_at'] = createAt;
    return _data;
  }
}

class Address {
  Address({
    required this.latitudeOrder,
    required this.longitudeOrder,
    required this.textLocationOrder,
    required this.latitudeStore,
    required this.longitudeStore,
    required this.regionId,
    required this.cityId,
    required this.cityAr,
    required this.cityEn,
  });
  late final double latitudeOrder;
  late final double longitudeOrder;
  late final String textLocationOrder;
  late final double latitudeStore;
  late final double longitudeStore;
  late final String regionId;
  late final String cityId;
  late final String cityAr;
  late final String cityEn;

  Address.fromJson(Map<String, dynamic> json) {
    latitudeOrder = json['latitude_order'];
    longitudeOrder = json['longitude_order'];
    textLocationOrder = json['text_location_order'];
    latitudeStore = json['latitude_store'];
    longitudeStore = json['longitude_store'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    cityAr = json['city_ar'];
    cityEn = json['city_en'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['latitude_order'] = latitudeOrder;
    _data['longitude_order'] = longitudeOrder;
    _data['text_location_order'] = textLocationOrder;
    _data['latitude_store'] = latitudeStore;
    _data['longitude_store'] = longitudeStore;
    _data['region_id'] = regionId;
    _data['city_id'] = cityId;
    _data['city_ar'] = cityAr;
    _data['city_en'] = cityEn;
    return _data;
  }
}

class Store {
  Store({required this.id, required this.storeName, required this.avatarImg});
  late final int id;
  late final String storeName;
  late final String avatarImg;

  Store.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    storeName = json['store_name'];
    avatarImg = json['avatar_img'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['store_name'] = storeName;
    _data['avatar_img'] = avatarImg;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.mobile,
    this.email,
    required this.gender,
  });
  late final String id;
  late final String fullName;
  late final String mobile;
  late final Null email;
  late final String gender;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    email = null;
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['full_name'] = fullName;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['gender'] = gender;
    return _data;
  }
}
