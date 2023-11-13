import 'package:flutter/material.dart';

class UserManagementScreen extends StatefulWidget {
  @override
  _UserManagementScreenState createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _selectedDesignation = 'User';

  List<User> _users = [
    User('Kavi Raj', 'kaviraj@email.com', 'Admin'),
    User('Narender', 'narender@email.com', 'User'),
    // Add more users as needed
  ];

  List<String> _designations = ['Admin', 'User'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Management'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'App Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            ListTile(
              title: Text('User Management'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User Management',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            for (User user in _users) _buildUserListTile(user, context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addUser(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildUserListTile(User user, BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Chip(
              label: Text(user.role),
              backgroundColor: Colors.blue,
              labelStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteUser(context, user);
              },
            ),
            SizedBox(width: 8),
            ElevatedButton(
              onPressed: () {
                // Handle edit button click
                _editUser(context, user);
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }

  void _editUser(BuildContext context, User user) {
    _nameController.text = user.name;
    _emailController.text = user.email;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit User'),
          content: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              DropdownButton<String>(
                value: _selectedDesignation,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDesignation = newValue!;
                  });
                },
                items: _designations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
                // Update the user's name, email, and designation
                user.name = _nameController.text;
                user.email = _emailController.text;
                user.role = _selectedDesignation;
                // Close the dialog
                Navigator.pop(context);
                // Show a snackbar or other feedback to indicate success
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Edited user: ${user.name}'),
                  ),
                );
                // Trigger a rebuild to reflect the edited name
                setState(() {});
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(BuildContext context, User user) {
    // Remove the dismissed user from the list
    setState(() {
      _users.remove(user);
    });
    // Show a snackbar or other feedback to indicate success
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted user: ${user.name}'),
      ),
    );
  }

  void _addUser(BuildContext context) {
    _nameController.text = '';
    _emailController.text = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add User'),
          content: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              DropdownButton<String>(
                value: _selectedDesignation,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDesignation = newValue!;
                  });
                },
                items: _designations.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
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
                // Add the new user
                User newUser = User(_nameController.text, _emailController.text, _selectedDesignation);
                _users.add(newUser);
                // Close the dialog
                Navigator.pop(context);
                // Show a snackbar or other feedback to indicate success
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Added new user: ${newUser.name}'),
                  ),
                );
                // Trigger a rebuild to reflect the added user
                setState(() {});
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class User {
  String name;
  String email;
  String role;

  User(this.name, this.email, this.role);
}
