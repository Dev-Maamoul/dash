class ProductModel {
  ProductModel({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    required this.discountPercentage,
    required this.discountStart,
    required this.discountEnd,
    required this.gift,
    required this.public,
    required this.available,
    required this.multiOption,
    required this.expirationStart,
    required this.expirationEnd,
    required this.storeId,
    required this.createdAt,
    required this.updatedAt,
    required this.preparationTime,
    this.deleteAt,
    required this.photos,
    required this.allergies,
    required this.sizes,
    required this.details,
    required this.options,
  });
  String? id;
  Category? category;
  String? name;
  String? description;
  int? discountPercentage;
  String? discountStart;
  String? discountEnd;
  bool? gift;
  bool? public;
  bool? available;
  bool? multiOption;
  String? expirationStart;
  String? expirationEnd;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? preparationTime;
  String? deleteAt;
  List<Photos>? photos;
  List<Allergies>? allergies;
  List<Sizes>? sizes;
  List<Details>? details;
  List<Options>? options;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = Category.fromJson(json['category'] ?? {});
    name = json['name'];
    description = json['description'];
    discountPercentage = json['discount_percentage'];
    discountStart = json['discount_start'];
    discountEnd = json['discount_end'];
    gift = json['gift'];
    public = json['public'];
    available = json['available'];
    multiOption = json['multi_option'];
    expirationStart = json['expiration_start'];
    expirationEnd = json['expiration_end'];
    storeId = json['store_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    preparationTime = json['preparation_time'];
    deleteAt = null;
    photos = List.from(
      json['photos'] ?? [],
    ).map((e) => Photos.fromJson(e)).toList();
    allergies = List.from(
      json['allergies'] ?? [],
    ).map((e) => Allergies.fromJson(e)).toList();
    sizes = List.from(
      json['sizes'] ?? [],
    ).map((e) => Sizes.fromJson(e)).toList();
    details = List.from(
      json['details'] ?? [],
    ).map((e) => Details.fromJson(e)).toList();
    options = List.from(
      json['options'] ?? [],
    ).map((e) => Options.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['category'] = category?.toJson();
    _data['name'] = name;
    _data['description'] = description;
    _data['discount_percentage'] = discountPercentage;
    _data['discount_start'] = discountStart;
    _data['discount_end'] = discountEnd;
    _data['gift'] = gift;
    _data['public'] = public;
    _data['available'] = available;
    _data['multi_option'] = multiOption;
    _data['expiration_start'] = expirationStart;
    _data['expiration_end'] = expirationEnd;
    _data['store_id'] = storeId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['preparation_time'] = preparationTime;
    _data['delete_at'] = deleteAt;
    _data['photos'] = photos?.map((e) => e.toJson()).toList();
    _data['allergies'] = allergies?.map((e) => e.toJson()).toList();
    _data['sizes'] = sizes?.map((e) => e.toJson()).toList();
    _data['details'] = details?.map((e) => e.toJson()).toList();
    _data['options'] = options?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Category {
  Category({
    required this.ar,
    required this.en,
    required this.id,
    required this.storeId,
  });
  String? ar;
  String? en;
  String? id;
  int? storeId;

  Category.fromJson(Map<String, dynamic> json) {
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

class Photos {
  Photos({required this.url, required this.photoId, required this.productId});
  String? url;
  String? photoId;
  String? productId;

  Photos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    photoId = json['photo_id'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['photo_id'] = photoId;
    _data['product_id'] = productId;
    return _data;
  }
}

class Allergies {
  Allergies({required this.id, required this.allergy, required this.productId});
  String? id;
  String? allergy;
  String? productId;

  Allergies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    allergy = json['allergy'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['allergy'] = allergy;
    _data['product_id'] = productId;
    return _data;
  }
}

class Sizes {
  Sizes({
    required this.id,
    required this.color,
    required this.price,
    required this.title,
    required this.productId,
    required this.stock,
    required this.sold,
  });
  String? id;
  String? color;
  double? price;
  String? title;
  String? productId;
  int? stock;
  int? sold;

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    price = json['price'];
    title = json['title'];
    productId = json['product_id'];
    stock = json['stock'];
    sold = json['sold'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['color'] = color;
    _data['price'] = price;
    _data['title'] = title;
    _data['product_id'] = productId;
    _data['stock'] = stock;
    _data['sold'] = sold;
    return _data;
  }
}

class Details {
  Details({
    required this.id,
    required this.title,
    required this.value,
    required this.productId,
  });
  String? id;
  String? title;
  String? value;
  String? productId;

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    value = json['value'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['value'] = value;
    _data['product_id'] = productId;
    return _data;
  }
}

class Options {
  Options({
    required this.id,
    required this.price,
    required this.title,
    required this.productId,
  });
  String? id;
  double? price;
  String? title;
  String? productId;

  Options.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    title = json['title'];
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['price'] = price;
    _data['title'] = title;
    _data['product_id'] = productId;
    return _data;
  }
}
