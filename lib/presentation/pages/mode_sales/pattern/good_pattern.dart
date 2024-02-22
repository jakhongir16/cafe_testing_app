import 'package:flutter/material.dart';

class GoodPattern extends StatelessWidget {
  const GoodPattern({super.key, required this.cost, required this.image, required this.itemCount, required this.name});
  final String image;
  final String name;
  final int itemCount;
  final int cost;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      height: 100,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                image,
                height: 60,
                width: 50,
              ),
               Spacer(),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    cost.toString(),
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                   const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Склад: $itemCount",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10,),
          Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
          )

        ],
      ),
    );
  }
}