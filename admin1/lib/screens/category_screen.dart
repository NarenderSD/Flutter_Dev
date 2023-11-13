import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Screen'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo or image can be added here
            Image.asset('assets/logo.png'), // Replace with your image asset

            SizedBox(height: 20),

            Text(
              'Select a Category:',
              style: TextStyle(fontSize: 18),
            ),

            SizedBox(height: 20),

            CategoryItem(
              title: 'Category 1',
              image: 'assets/category1.png', // Replace with your image asset
              onTap: () {
                // Navigate to the second screen for Category 1
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondScreen('Category 1'),
                ));
              },
            ),

            CategoryItem(
              title: 'Category 2',
              image: 'assets/category2.png', // Replace with your image asset
              onTap: () {
                // Navigate to the second screen for Category 2
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondScreen('Category 2'),
                ));
              },
            ),

            // Add more CategoryItem widgets for other categories
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  CategoryItem({required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(image),
          Text(title, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String categoryName;

  SecondScreen(this.categoryName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text('Display images for $categoryName here'),
      ),
    );
  }
}
