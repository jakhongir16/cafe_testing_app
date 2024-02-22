import 'package:flutter/material.dart';

class TabPattern extends StatelessWidget {
  const TabPattern({super.key, 
  required this.alterTab,
  required this.tabColor,
  required this.textColor,
  required this.title,
  });
  final VoidCallback alterTab;
  final Color tabColor;
  final Color textColor;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: alterTab,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border(
              bottom: BorderSide(color: tabColor, width: 2),
              top: const BorderSide(color: Colors.grey, width: 2),
            )
          ),
          child: Text(
            title,
            style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}