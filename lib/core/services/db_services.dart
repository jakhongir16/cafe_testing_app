import 'package:cafe_task/models/cashier/cashier_model.dart';
import 'package:cafe_task/models/good/good_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ServiceOfSqflite {
  List<CashierModel> cashiers = [
   CashierModel(
    items: 'N_o123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,),
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,),
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,),
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,),
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,),
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,),
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,), 
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,), 
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,), 
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,), 
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,), 
    CashierModel(
    items: '№123 15:45', 
    name: 'Тапчан VIP 2', 
    isPaid: 1, 
    cost: 999999,),  
  ];
  List<GoodModel> goods = [
    GoodModel(
      name: "Coca-Cola Classic 2л пластик 800", 
      generalDigit: 999, 
      cost: 400),GoodModel(
      name: "Coca-Cola Classic 2л пластик 800", 
      generalDigit: 999, 
      cost: 400),GoodModel(
      name: "Coca-Cola Classic 2л пластик 800", 
      generalDigit: 999, 
      cost: 400),GoodModel(
      name: "Coca-Cola Classic 2л пластик 800", 
      generalDigit: 999, 
      cost: 400),GoodModel(
      name: "Coca-Cola Classic 2л пластик 800", 
      generalDigit: 999, 
      cost: 400),GoodModel(
      name: "Coca-Cola Classic 2л пластик 800", 
      generalDigit: 999, 
      cost: 400),
  ];
  List<GoodModel> baskets = [
   GoodModel(
    name: "Coca-Cola Classic 2л пластик 800", 
    generalDigit: 4, 
    cost: 200),GoodModel(
    name: "Coca-Cola Classic 2л пластик 800", 
    generalDigit: 4, 
    cost: 200),GoodModel(
    name: "Coca-Cola Classic 2л пластик 800", 
    generalDigit: 4, 
    cost: 200),
  ];
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
       join(path, 'database.db'),
       onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Enter(enter INTEGER NOT NULL)"
        );
        await database.execute(
          "CREATE TABLE Enter1(enter INTEGER NOT NULL)",   
        );
        await database.execute(
           "CREATE TABLE Cashier(items TEXT NOT NULL, name TEXT NOT NULL, isPaid INTEGER NOT NULL,cost INTEGER NOT NULL)",
        );
        await database.execute(
           "CREATE TABLE Good(name TEXT NOT NULL, generalDigit INTEGER NOT NULL, cost INTEGER NOT NULL)", 
        );
        await database.execute(
          "CREATE TABLE Basket(name TEXT NOT NULL, generalDigit INTEGER NOT NULL, cost INTEGER NOT NULL)",
        );
       },
       version: 1,
    );
  }


   Future discoverItem() async {
    final Database db = await initializeDB();
    for(CashierModel cashier in cashiers){
      print('-------------$cashier---------------');
      await db.insert('Cashier', cashier.toMap());
    }
   }

   Future discoverEnter() async {
     final Database db = await initializeDB();
     await db.insert('Enter', {"enter": 0});  
    }

    Future discoverEnter1() async {
      final Database db = await initializeDB();
      await db.insert('Enter1', {"enter": 0});
    }

    Future discoverGood() async {
      final Database db = await initializeDB();
      for(GoodModel cashier in goods){
        print('---------------$cashier--------');
        await db.insert('Good', cashier.toMap());
      }
    }
  
    Future discoverBasket() async {
      final Database db = await initializeDB();
      for(GoodModel cashier in baskets){
        print('-------$cashier-----------');
        await db.insert('Basket', cashier.toMap());
      }
    }

   Future<List<Map<String, dynamic>>> receiveEnter() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Enter');
    return queryResult;
   }

   Future<List<Map<String, dynamic>>> receiveEnter1() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Enter1');
    return queryResult;
   }

   Future<List<CashierModel>> receiveItems() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Cashier');
    return queryResult.map((e) => CashierModel.fromMap(e)).toList();
   }

   Future<List<GoodModel>> receiveGood() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Good');
    return queryResult.map((e) => GoodModel.fromMap(e)).toList();
   }

   Future<List<GoodModel>> receiveBasket() async {
    final db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Basket');
    return queryResult.map((e) => GoodModel.fromMap(e)).toList();
   }

   }
