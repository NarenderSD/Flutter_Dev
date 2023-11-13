import 'package:agro/widgets/CategoriesWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00A368),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(right: 20,left: 15,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu,
                      color: Colors.white,
                      size: 30,),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xFF00A368),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurRadius: 2,
                            )
                          ]

                      ),
                      child:badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                            badgeColor: Colors.red
                        ),
                        badgeContent: Text('3'),
                        child: InkWell(
                          onTap: (){},
                          child: Icon(CupertinoIcons.cart,
                            size: 30,
                            color: Colors.white,),
                        ),
                      ),

                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome',style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),),
                    Text('What do you want to buy',
                      style: TextStyle(color: Colors.white,fontSize: 20),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Search here....',
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.filter_list)
                  ],
                ),
              ),
              //Product Widgets
              Container(
                padding: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesWidget(),
                    PopularItem(numberOfItems: 50,
                      imagePaths:
                      [
                        'assets/img1.jpg'
                            'assets/img1.jpg'
                            'assets/img1.jpg'
                            'assets/img1.jpg'
                            'assets/img1.jpg'
                      ],)
                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );