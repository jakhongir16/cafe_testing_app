class GoodModel {
  String name;
  int generalDigit;
  int cost;

  GoodModel({required this.name, required this.generalDigit, required this.cost});

  GoodModel.fromMap(Map<dynamic, dynamic> item):
      name = item["name"], generalDigit = item["generalDigit"], cost = item["cost"];

  Map<String, dynamic> toMap(){
    return {
        'name': name,
        'generalDigit': generalDigit,
        'cost': cost
    };
  }    
}