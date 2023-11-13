import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ProductManagementScreen extends StatefulWidget {
  @override
  _ProductManagementScreenState createState() => _ProductManagementScreenState();
}

class _ProductManagementScreenState extends State<ProductManagementScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  File? _selectedImage;

  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    // Load products from local storage when the screen is initialized.
    _loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Management'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.indigo],
                ),
              ),
              child: Center(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,

                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Back'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Deshboard'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to the home screen
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            ListTile(
              title: Text('Inventory'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to the home screen
                Navigator.pushReplacementNamed(context, '/inventory_management');
              },
            ),
            ListTile(
              title: Text('Inventory'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to the home screen
                Navigator.pushReplacementNamed(context, '/des');
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
                'Product Management',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildProductList(),
              _buildProductForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return Container(
      height: 200, // Set a fixed height or adjust as needed
      child: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          Product product = _products[index];
          return Card(
            elevation: 3,
            child: ListTile(
              title: Text(product.name),
              subtitle: Text(product.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('\₹${product.price.toStringAsFixed(2)}'),
                  SizedBox(width: 8),
                  Image.file(product.image, width: 50, height: 50),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteProduct(product);
                    },
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.green),
                    onPressed: () {
                      _editProduct(context, product);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductForm() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Product',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _selectImage();
              },
              child: Text('Select Image'),
            ),
            SizedBox(height: 8),
            _selectedImage != null
                ? Image.file(
              _selectedImage!,
              width: 100,
              height: 100,
            )
                : Container(),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price (\₹)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _addProduct();
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }

  void _addProduct() {
    String name = _nameController.text;
    double price = double.tryParse(_priceController.text) ?? 0.0;
    String description = _descriptionController.text;
    String category = _categoryController.text;

    if (name.isNotEmpty && price > 0 && _selectedImage != null) {
      Product product = Product(name, price, description, _selectedImage!, category);
      setState(() {
        _products.add(product);
      });

      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _categoryController.clear();
      _selectedImage = null;

      // Save the updated list of products to local storage
      _saveProducts();
    }
  }

  void _deleteProduct(Product product) {
    setState(() {
      _products.remove(product);
    });

    // Save the updated list of products to local storage
    _saveProducts();
  }

  void _editProduct(BuildContext context, Product product) {
    _nameController.text = product.name;
    _priceController.text = product.price.toString();
    _descriptionController.text = product.description;
    _categoryController.text = product.category;
    _selectedImage = product.image;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Product'),
          content: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price (\₹)'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Update the product's details
                product.name = _nameController.text;
                product.price = double.tryParse(_priceController.text) ?? 0.0;
                product.description = _descriptionController.text;
                product.category = _categoryController.text;
                product.image = _selectedImage!;
                // Close the dialog
                Navigator.pop(context);
                // Show a snackbar or other feedback to indicate success
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Edited product: ${product.name}'),
                  ),
                );
                // Trigger a rebuild to reflect the edited product
                setState(() {});

                // Save the updated list of products to local storage
                _saveProducts();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _selectImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
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

  void _saveProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final productsJson = jsonEncode(_products);
    await prefs.setString('products', productsJson);
  }
}

class Product {
  String name;
  double price;
  String description;
  File image;
  String category;

  Product(this.name, this.price, this.description, this.image, this.category);

  // Create a constructor to deserialize from JSON
  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
  price = json['price'],
  description = json['description'],
  image = File(json['image']),
  category = json['category'];

  // Create a method to serialize to JSON
  Map<String, dynamic> toJson() => {
  'name': name,
  'price': price,
  'description': description,
  'image': image.path,
  'category': category,
  };
}
