import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Hey! Rohit Prajapati'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey.shade200,
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: const AssetImage('assets/images/account.png'),
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 16),
            const Text(
              'Rohit Prajapati',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'rohitprajapati09190@gmail.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(color: Colors.grey),
            Expanded(
              child: ListView(
                children: [
                  _buildProfileCard(Icons.phone, 'Phone', '+1 234 567 890'),
                  _buildProfileCard(Icons.location_city, 'Address',
                      '123 Main Street, City, Country'),
                  _buildProfileCard(
                      Icons.calendar_today, 'Date of Birth', 'Jan 1, 1990'),
                  // _buildProfileCard(Icons.work, 'Job Title',
                  //     'Software Developer'), // New info added
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showLogoutDialog(context);
              },
              child: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.purple, // Text color
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildProfileCard(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log Out'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Log Out'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white),
            ),
          ],
        );
      },
    );
  }
}
