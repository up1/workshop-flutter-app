import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    // Return hello text
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: Center(child: const Text('Hello, this is the account screen!')),
    );
  }
}
