class CashierModel {
  String items;
  String name;
  int isPaid;
  int cost;

  CashierModel({required this.items, required this.name, required this.isPaid, required this.cost});

  CashierModel.fromMap(Map<dynamic, dynamic> item):
              items = item["items"], name = item["name"],  isPaid = item["isPaid"], cost = item["cost"];

  Map<String, dynamic> toMap(){
    return {'items': items, 'name': name, 'isPaid': isPaid, 'cost': cost
    };
  }            
}

enum Payment {
  paid, noPaid, paidProcess,
}