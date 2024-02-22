import 'package:cafe_task/core/services/db_services.dart';
import 'package:cafe_task/models/cashier/cashier_model.dart';
import 'package:flutter/material.dart';

class CashierChapter extends StatefulWidget {
  const CashierChapter({super.key});

  @override
  State<CashierChapter> createState() => _CashierChapterState();
}

class _CashierChapterState extends State<CashierChapter> {
  bool isLoading = false;
  List<CashierModel>? items;

  Future obtainItems() async{
    setState(() {
      isLoading = true;
    });
    List<Map<String, dynamic>> enter = await ServiceOfSqflite().receiveEnter();
    if(enter.isEmpty){
      await ServiceOfSqflite().discoverItem();
    }
    await ServiceOfSqflite().discoverEnter();
    items = await ServiceOfSqflite().receiveItems();
    print('<----$items------>');
    setState(() {
      isLoading = false;
    });
  }
  
  @override
  void initState() {
    obtainItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading?ListView.builder(
        itemCount: items?.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index){
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            height: 80,
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.yellow.shade100
                  ),
                  child: Icon(items?[index].isPaid==0? Icons.receipt:items?[index].isPaid==1?Icons.payments_outlined:Icons.print, color: Colors.indigoAccent,),
                ),
                Expanded(
                  child:  Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: Column(children: [
                    Row(children: [
                      Text('Посититель', style: Theme.of(context).textTheme.bodyLarge,), const Spacer(),
                      Text(items?[index].items??""),
                    ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(items?[index].name??"", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),), const Spacer(),
                        Text(items?[index].cost.toString()??"", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700, fontSize: 22),),
                      ],
                      ),
                  ]),
                  ),
                )
              ],
            ),
          );
        },
    ): const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}