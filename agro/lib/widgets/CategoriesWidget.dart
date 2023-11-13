import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Category",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00A368),
            ),)
            Text("See All", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
            color: Colors.black54,
            ),)
          ],
        ),)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // for(int i=1; i<8; i++)
              Container(
                margin: EdgeInsets.symmetric(ho),
              )
            ],
          ),
        )
      ],
    );
  }
}
