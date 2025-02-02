import 'package:flutter/material.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Page'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to Account Page'),
      ),
    );
  }
}
