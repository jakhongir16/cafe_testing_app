import 'package:cafe_task/presentation/pages/cashier/cashier_chapter.dart';
import 'package:cafe_task/presentation/pages/waiter/waiter_chapter.dart';
import 'package:flutter/material.dart';

import '../mode_sales/mode_sales_chapter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indexOfPage = 0;
  PageController controller = PageController();
  
  void alterIndex(index){
    Navigator.pop(context);
    setState(() {
      indexOfPage = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        title: Text(indexOfPage==0?"Kaccир": indexOfPage==1?"Выбор":indexOfPage==2?"Режим продаж":"Склад"),
        centerTitle: false,
        actions: [
           IconButton(onPressed: (){

           }, icon: const Icon(Icons.search, color: Colors.blue,),
           ),
        ],
      ),
      
      drawer: Drawer(
                
                child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Иван Иванов Иванович",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.blue,fontSize: 22),),
                    Text("сотрудник",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.blue),),
                  ],
                ),
              ),
              const Divider(),
              ListTile(
                leading: Icon(
                  Icons.sync,
                  color: Colors.blue.shade800,
                ),
                title: const Text("Синхронизация"),
                subtitle: const Text("19.04.2022 15:04"),
              ),
              ListTile(
                onTap: (){
                  alterIndex(0);
                  controller.jumpToPage(0);
                },
                leading: Icon(
                  Icons.calculate,
                  color: Colors.blue.shade800,
                ),
                title: const Text("Кассир"),
              ),
              ListTile(
                onTap: (){
                  alterIndex(1);
                  controller.jumpToPage(1);
                },
                leading: Icon(
                  Icons.accessibility_outlined,
                  color: Colors.blue.shade800,
                ),
                title: const Text("Официант"),
              ),
              ListTile(
                onTap: (){
                  alterIndex(2);
                  controller.jumpToPage(2);
                },
                leading: Icon(
                  Icons.local_mall_outlined,
                  color: Colors.blue.shade800,
                ),
                title: const Text("Режим продажи"),
              ),
              ListTile(
                leading: Icon(
                  Icons.warehouse,
                  color: Colors.blue.shade800,
                ),
                title: const Text("Склад"),
              ),
              ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.blue.shade800,
                ),
                title: const Text("Сменить сотрудника"),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          CashierChapter(),
          WaiterPage(),
          ModeSalesChapter(),
        ],
      )
    );
  }
}
