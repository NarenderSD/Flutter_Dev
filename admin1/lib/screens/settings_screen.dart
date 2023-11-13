import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
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
            // Add more drawer items as needed
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('General Settings'),
            _buildSettingItem('Store Information', Icons.store),
            _buildSettingItem('Payment Settings', Icons.payment),
            _buildSettingItem('Shipping Settings', Icons.local_shipping),

            SizedBox(height: 20),

            _buildSectionHeader('Security'),
            _buildSettingItem('Change Password', Icons.lock),

            SizedBox(height: 20),

            _buildSectionHeader('Notifications'),
            _buildSettingItem('Email Notifications', Icons.email),
            _buildSettingItem('Push Notifications', Icons.notifications),

            SizedBox(height: 20),

            _buildSectionHeader('Appearance'),
            _buildSettingItem('Theme', Icons.color_lens),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSettingItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Implement the specific setting item action
        // _handleSettingItemClick(context, title);
      },
    );
  }

  void _handleSettingItemClick(BuildContext context, String title) {
    // Implement the action based on the clicked setting item
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Setting Clicked'),
          content: Text('You clicked on the setting: $title'),
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
