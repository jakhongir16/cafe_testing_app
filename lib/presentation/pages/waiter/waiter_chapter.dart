import 'package:flutter/material.dart';

import 'patterns/dish_pattern.dart';

class WaiterPage extends StatefulWidget {
  const WaiterPage({super.key});

  @override
  State<WaiterPage> createState() => _WaiterPageState();
}

class _WaiterPageState extends State<WaiterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         const SizedBox(
            height: 20,
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5,),
          child: Row(
            children: [
              DishPattern(title: "Основный зал"),
              SizedBox(width: 10,),
              DishPattern(title: "Летка"),
            ],
          ),
          ),
          Padding(padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 130,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.yellow.shade100,
                        ),
                        child: const Icon(Icons.receipt, color: Colors.indigoAccent,),
                  
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "Vip 1",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),

                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 25,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           color: Colors.blue.shade100,
                        ),
                        child: const Icon(Icons.print_outlined, color: Colors.indigoAccent,),
                    
                      ),
                      Expanded(child: Center(
                        child: Text(
                          "Vip 2",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ))
                    ],
                  ),
                ),
              )
            ],
          ),
          )
        ],
      ),
    );
  }
}