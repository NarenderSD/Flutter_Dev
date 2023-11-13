import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'category_conatiner.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  getDeatils()async{
    var response = await http.get(Uri.parse("https://api.aartisaree.com:4300/api/product?category_id=75")).then((value){
      print("data ${value.body}");
    });

  }
  @override
  void initState() {
    getDeatils();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: const Text(
          'TODAYS DEAL',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryContainer(
                    image: 'assets/img1.jpg',
                    name: 'Detailed names',
                    amount: 'Rs 3100',
                  ),
                  CategoryContainer(
                    image: 'img11.jpg',
                    name: 'Detailed names',
                    amount: 'Rs 3100',
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryContainer(
                    image: 'img12.png',
                    name: 'Detailed names',
                    amount: 'Rs 3100',
                  ),
                  CategoryContainer(
                    image: 'img9.png',
                    name: 'Detailed names',
                    amount: 'Rs 3100',
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryContainer(
                    image: 'img5.png',
                    name: 'Detailed names',
                    amount: 'Rs 3100',
                  ),
                  CategoryContainer(
                    image: 'img1.png',
                    name: 'Detailed names',
                    amount: 'Rs 3100',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}