class RevenuesPaymentsStoreModel {
  RevenuesPaymentsStoreModel({
    required this.total,
    required this.maamoulProfit,
    required this.storeProfit,
  });
  num? total;
  num? maamoulProfit;
  num? storeProfit;

  RevenuesPaymentsStoreModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    maamoulProfit = json['maamoul_profit'];
    storeProfit = json['store_profit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['maamoul_profit'] = maamoulProfit;
    _data['store_profit'] = storeProfit;
    return _data;
  }
}
