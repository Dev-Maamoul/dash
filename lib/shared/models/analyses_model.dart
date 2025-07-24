class AnalysesModel {
  AnalysesModel({
    required this.store,
    required this.users,
    required this.orders,
    required this.drivers,
    required this.company,
    required this.profit,
  });
  late final Store store;
  late final Users users;
  late final Orders orders;
  late final int drivers;
  late final int company;
  late final Profit profit;

  AnalysesModel.fromJson(Map<String, dynamic> json) {
    store = Store.fromJson(json['store']);
    users = Users.fromJson(json['users']);
    orders = Orders.fromJson(json['orders']);
    drivers = json['drivers'];
    company = json['company'];
    profit = Profit.fromJson(json['profit']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['store'] = store.toJson();
    _data['users'] = users.toJson();
    _data['orders'] = orders.toJson();
    _data['drivers'] = drivers;
    _data['company'] = company;
    _data['profit'] = profit.toJson();
    return _data;
  }
}

class Store {
  Store({
    required this.all,
    required this.processing,
    required this.reject,
    required this.active,
    required this.closed,
    required this.suspended,
    required this.block,
  });
  late final int all;
  late final int processing;
  late final int reject;
  late final int active;
  late final int closed;
  late final int suspended;
  late final int block;

  Store.fromJson(Map<String, dynamic> json) {
    all = json['all'];
    processing = json['processing'];
    reject = json['reject'];
    active = json['active'];
    closed = json['closed'];
    suspended = json['suspended'];
    block = json['block'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    _data['processing'] = processing;
    _data['reject'] = reject;
    _data['active'] = active;
    _data['closed'] = closed;
    _data['suspended'] = suspended;
    _data['block'] = block;
    return _data;
  }
}

class Users {
  Users({
    required this.all,
    required this.processing,
    required this.reject,
    required this.active,
    required this.closed,
    required this.suspended,
    required this.block,
  });
  late final int all;
  late final int processing;
  late final int reject;
  late final int active;
  late final int closed;
  late final int suspended;
  late final int block;

  Users.fromJson(Map<String, dynamic> json) {
    all = json['all'];
    processing = json['processing'];
    reject = json['reject'];
    active = json['active'];
    closed = json['closed'];
    suspended = json['suspended'];
    block = json['block'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    _data['processing'] = processing;
    _data['reject'] = reject;
    _data['active'] = active;
    _data['closed'] = closed;
    _data['suspended'] = suspended;
    _data['block'] = block;
    return _data;
  }
}

class Orders {
  Orders({
    required this.all,
    required this.pending,
    required this.accepted,
    required this.waitingPaid,
    required this.paid,
    required this.processing,
    required this.pendingDriver,
    required this.receiving,
    required this.shipped,
    required this.delivered,
    required this.cancelled,
  });
  late final int all;
  late final int pending;
  late final int accepted;
  late final int waitingPaid;
  late final int paid;
  late final int processing;
  late final int pendingDriver;
  late final int receiving;
  late final int shipped;
  late final int delivered;
  late final int cancelled;

  Orders.fromJson(Map<String, dynamic> json) {
    all = json['all'];
    pending = json['pending'];
    accepted = json['accepted'];
    waitingPaid = json['waiting_paid'];
    paid = json['paid'];
    processing = json['processing'];
    pendingDriver = json['pending_driver'];
    receiving = json['receiving'];
    shipped = json['shipped'];
    delivered = json['delivered'];
    cancelled = json['cancelled'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    _data['pending'] = pending;
    _data['accepted'] = accepted;
    _data['waiting_paid'] = waitingPaid;
    _data['paid'] = paid;
    _data['processing'] = processing;
    _data['pending_driver'] = pendingDriver;
    _data['receiving'] = receiving;
    _data['shipped'] = shipped;
    _data['delivered'] = delivered;
    _data['cancelled'] = cancelled;
    return _data;
  }
}

class Profit {
  Profit({
    required this.total,
    required this.orders,
    required this.delivery,
    required this.profitOrders,
    required this.profitDelivery,
    required this.totalProfit,
  });
  late final double total;
  late final double orders;
  late final int delivery;
  late final double profitOrders;
  late final int profitDelivery;
  late final double totalProfit;

  Profit.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    orders = json['orders'];
    delivery = json['delivery'];
    profitOrders = json['profit_orders'];
    profitDelivery = json['profit_delivery'];
    totalProfit = json['total_profit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['orders'] = orders;
    _data['delivery'] = delivery;
    _data['profit_orders'] = profitOrders;
    _data['profit_delivery'] = profitDelivery;
    _data['total_profit'] = totalProfit;
    return _data;
  }
}
