import 'package:flutter/material.dart';

class LogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Logs')),
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
                // Navigate to the home screen
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to the dashboard screen
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to the settings screen
                Navigator.pushReplacementNamed(context, '/settings');
              },
            ),
            // Add more drawer items as needed
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLogsListTile('User Login', Icons.person, 'Admin logged in'),
            _buildLogsListTile('Product Added', Icons.add, 'New product added'),
            _buildLogsListTile('Order Shipped', Icons.local_shipping, 'Order #123 shipped'),
            // Add more log entries as needed
          ],
        ),
      ),
    );
  }

  Widget _buildLogsListTile(String title, IconData icon, String subtitle) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        // Implement the specific log item action
        // _handleLogItemClick(context, title);
      },
    );
  }

  void _handleLogItemClick(BuildContext context, String title) {
    // Implement the action based on the clicked log item
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log Clicked'),
          content: Text('You clicked on the log: $title'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
