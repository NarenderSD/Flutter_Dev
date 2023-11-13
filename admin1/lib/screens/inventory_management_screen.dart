import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class InventoryManagementApp extends StatefulWidget {
  @override
  _InventoryManagementAppState createState() => _InventoryManagementAppState();
}

class _InventoryManagementAppState extends State<InventoryManagementApp> {
  List<Product> _products = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  File? _selectedImage;

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
        title: Text('Inventory Management'),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: (){Navigator.pop(context,true);}
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildProductForm(),
              _buildProductList(),
            ],
          ),
        ),
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
              onPressed: _selectImage,
              child: Text('Select Image'),
            ),
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
            TextField(
              controller: _quantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _addProduct,
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList() {
    return ListView.builder(
      shrinkWrap: true, // Allow the list to take only the space it needs
      itemCount: _products.length,
      itemBuilder: (context, index) {
        Product product = _products[index];
        return Card(
          elevation: 3,
          child: ListTile(
            title: Text(product.name),
            subtitle: Text(product.description),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _addProduct() {
    String name = _nameController.text;
    double price = double.tryParse(_priceController.text) ?? 0.0;
    String description = _descriptionController.text;
    String category = _categoryController.text;
    int quantity = int.tryParse(_quantityController.text) ?? 0;

    if (name.isNotEmpty && price > 0 && _selectedImage != null) {
      Product product = Product(
        name,
        price,
        description,
        category,
        quantity,
        _selectedImage!,
      );
      setState(() {
        _products.add(product);
      });

      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _categoryController.clear();
      _quantityController.clear();
      _selectedImage = null;

      // Save the updated list of products to local storage
      _saveProducts();
    }
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
  String category;
  int quantity;
  File image;

  Product(
      this.name,
      this.price,
      this.description,
      this.category,
      this.quantity,
      this.image,
      );

  // Create a constructor to deserialize from JSON
  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        price = json['price'],
        description = json['description'],
        category = json['category'],
        quantity = json['quantity'],
        image = File(json['image']);

  // Create a method to serialize to JSON
  Map<String, dynamic> toJson() => {
    'name': name,
    'price': price,
    'description': description,
    'category': category,
    'quantity': quantity,
    'image': image.path,
  };
}

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  ProductDetailsScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${product.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Price: \₹${product.price.toStringAsFixed(2)}'),
            Text('Description: ${product.description}'),
            Text('Category: ${product.category}'),
            Text('Quantity: ${product.quantity}'),
            Image.file(product.image, width: 400, height: 400),
          ],
        ),
      ),
    );
  }
}
