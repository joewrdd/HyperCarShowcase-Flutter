import 'package:flutter/material.dart';
import 'package:hyper_car_showcase/screens/chat_tab/chat.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
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
                    leading: Icon(Icons.email, color: Colors.white),
                    title: Text(
                      'Contact Support',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'support@hypercarshowcase.com',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const Divider(color: Colors.white24),
                  ListTile(
                    leading: const Icon(Icons.chat, color: Colors.white),
                    title: const Text(
                      'Live Chat',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      'Available 24/7',
                      style: TextStyle(color: Colors.white70),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const ChatScreen()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Card(
              color: Colors.grey.shade900,
              child: ExpansionTile(
                iconColor: Colors.white,
                collapsedIconColor: Colors.white,
                title: const Text(
                  'Frequently Asked Questions',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  _buildFaqItem(
                    'How do I add a car to favorites?',
                    'Tap the star icon on any car to add it to your favorites.',
                  ),
                  _buildFaqItem(
                    'How does the car quiz work?',
                    'Test your knowledge about cars through multiple-choice questions.',
                  ),
                  _buildFaqItem(
                    'Can I change my profile picture?',
                    'Yes, go to Edit Profile in settings to update your profile picture.',
                  ),
                  _buildFaqItem(
                    'How do I delete my account?',
                    'Contact support to request account deletion.',
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
                      'App Information',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Version: 1.0.0\n'
                      'Build: 2024.1.1\n'
                      '© 2024 Hyper Car Showcase',
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

  Widget _buildFaqItem(String question, String answer) {
    return ListTile(
      title: Text(
        question,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        answer,
        style: const TextStyle(color: Colors.white70),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
