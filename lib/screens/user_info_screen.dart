import 'package:flutter/material.dart';
import '../data/user_store.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Info')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${UserStore.name ?? "-"}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 12),
            Text(
              'Email: ${UserStore.email ?? "-"}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
