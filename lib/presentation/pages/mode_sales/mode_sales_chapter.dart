import 'package:cafe_task/core/services/db_services.dart';
import 'package:cafe_task/models/good/good_model.dart';
import 'package:cafe_task/presentation/pages/mode_sales/pattern/good_pattern.dart';
import 'package:cafe_task/presentation/pages/waiter/patterns/dish_pattern.dart';
import 'package:flutter/material.dart';

import 'pattern/tab_pattern.dart';

class ModeSalesChapter extends StatefulWidget {
  const ModeSalesChapter({super.key});

  @override
  State<ModeSalesChapter> createState() => _ModeSalesChapterState();
}

class _ModeSalesChapterState extends State<ModeSalesChapter> {
   int indexOfTab = 0;
   int? deleteIndex;

   bool isLoading = false;
   List<GoodModel>? items;
   List<GoodModel>? baskets;
  
   Future receiveItems() async {
    setState(() {
      isLoading = true;
    });
    List<Map<String, dynamic>> enter = await ServiceOfSqflite().receiveEnter1();
    if(enter.isEmpty){
      await ServiceOfSqflite().discoverBasket();
      await ServiceOfSqflite().discoverGood();
    }
    await ServiceOfSqflite().discoverEnter1();
    baskets = await ServiceOfSqflite().receiveBasket();
    items = await ServiceOfSqflite().receiveGood();
    setState(() {
      isLoading = false;
    });
   } 

   @override
  void initState() {
    receiveItems();
    super.initState();
  }

  void alterIndex(int index){
    setState(() {
      indexOfTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading ? Column(
      children: <Widget>[
        Row(
          children: [
           TabPattern(
            alterTab: (){
              alterIndex(0);
            },
            tabColor: indexOfTab == 0 ? Colors.blue : Colors.grey.shade100,
            title: "Товары (2300)",
            textColor: indexOfTab == 0 ? Colors.blue : Colors.grey,
          ),
          TabPattern(
            alterTab: (){
              alterIndex(1);
            }, 
            tabColor: indexOfTab == 1 ? Colors.blue : Colors.grey.shade100, 
            title: "Параметры",
            textColor: indexOfTab == 1 ? Colors.blue : Colors.grey, 
            )
          ]
        ),
        Column(
          children: List.generate(
            baskets?.length ?? 0, 
          (index) => Container(
           decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: deleteIndex == index ? Colors.indigo.shade100 : null,
           ),
           padding: const EdgeInsets.symmetric(
            horizontal: 20.0, vertical: 10,
           ),
           child: Column(
            children: [
              Row(children: [
                Expanded(
                  child: Text(
                    baskets?[index].name ?? 
                    "" + 
                         "${baskets![index].cost * baskets![index].generalDigit}",
                  style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                IconButton(onPressed: (){}, 
                icon: const Icon(Icons.add_circle_outline, color: Colors.green,
                ),
                ),
                Text(baskets?[index].generalDigit.toString() ?? "",
                style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(onPressed: (){
                  setState(() {
                    deleteIndex = index;
                  });
                }, 
                icon: const Icon(Icons.remove_circle_outline,
                color: Colors.red,
                
                ))

              ],),
              deleteIndex == index 
              ? Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
              
                      ),
                      child: Text(
                        "Удалить из счета",
                        style: Theme.of(context).textTheme.
                        labelLarge
                        ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.indigo.shade700,
                      ),
                      child: Text(
                        "Изменить цену",
                        style: Theme.of(context).textTheme.labelLarge
                        ?.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ) :  SizedBox.shrink()
            ],
           ),
          ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  child: Row(
                    children: [
                      DishPattern(title: "1 блюда"),
                      SizedBox(width: 10,),
                      DishPattern(title: "2 блюда"),

                    ],
                  ),
                ),
                GridView.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width / 300,
                  physics:  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  crossAxisCount: 2,
                  children: List.generate(
                    items?.length ?? 0, 
                  (index) => GoodPattern(
                    image: "assets/images/cola.png", 
                    name: items?[index].name ?? "",
                    itemCount: items?[index].generalDigit ?? 0,
                    cost: items?[index].cost ?? 0,    
                    )),
                  )
              ],
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20, vertical: 10,
            ),
            hintText: "Поиск",
            suffixIcon:  IconButton(
                     icon: const Icon(
                      Icons.qr_code_scanner,
                      color: Colors.blue,
                     ), 
                       onPressed: (){},
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    ) : const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}