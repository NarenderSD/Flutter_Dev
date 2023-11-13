import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Product> _products = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Dashboard')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/category');
              },
            ),
            ListTile(
              title: Text('Product'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/product_management');
              },
            ),
            ListTile(
              title: Text('User Management'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/user_management');
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/settings');
              },
            ),
            ListTile(
              title: Text('Logs'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/logs');
              },
            ),
            ListTile(
              title: Text('category'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/category');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildStatCard('Total Users', '1,000'),
              SizedBox(height: 8),
              _buildStatCard('Total Products', '${_products.length}'),
              SizedBox(height: 8),
              _buildStatCard('Total Orders', '1,200'),
              SizedBox(height: 20),
              Text(
                'Product Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildCategoryCard('Electronics', '250'),
              SizedBox(height: 8),
              _buildCategoryCard('Clothing', '150'),
              SizedBox(height: 8),
              _buildCategoryCard('Books', '100'),
              SizedBox(height: 8),
              _buildCategoryCard('Furniture', '75'),
              SizedBox(height: 20),
              Text(
                'Recent Activity',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Column(
                children: _products.map((product) {
                  return _buildProductCard(product);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String category, String quantity) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              category,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Quantity: $quantity',
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(product.name),
        subtitle: Text('Price: \₹${product.price.toStringAsFixed(2)}'),
      ),
    );
  }

  void _loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson = prefs.getString('products');
    if (productsJson != null) {
      final List<dynamic> productsList = jsonDecode(productsJson);
      setState(() {
        _products = productsList.map((item) => Product.fromJson(item)).toList();
      });
    }
  }
}

class Product {
  String name;
  double price;

  Product(this.name, this.price);

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
  };
}
