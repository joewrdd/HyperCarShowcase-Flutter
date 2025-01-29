import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              color: Colors.grey.shade900,
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'Data Collection',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      'We collect minimal data to provide you with the best experience. This includes your profile information and car preferences.',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const Divider(color: Colors.white24),
                  ListTile(
                    leading: const Icon(Icons.visibility, color: Colors.white),
                    title: const Text(
                      'Profile Visibility',
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {
                        // Handle profile visibility
                      },
                      activeColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.grey.shade900,
              child: const Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data Usage',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Your data is stored securely on Firebase\n'
                      '• We never share your personal information\n'
                      '• You can request data deletion at any time\n'
                      '• Chat messages are not stored permanently\n'
                      '• Your favorites are stored locally on your device',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
