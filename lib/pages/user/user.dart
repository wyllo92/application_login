import 'package:flutter/material.dart';
import '../../../widgets/appbar.dart';

class UserScreen extends StatelessWidget {
  final String username;
  final String password;

  const UserScreen({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Perfil de Usuario',
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, size: 70, color: Colors.white),
              ), // CircleAvatar
            ), // Center
            const SizedBox(height: 30),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildInfoRow('Usuario:', username),
                    const SizedBox(height: 15),
                    _buildInfoRow('Email:', '$username@demo.com'),
                    const SizedBox(height: 15),
                    _buildInfoRow(
                      'Contraseña:',
                      '${'*' * password.length} (${password.length} caracteres)',
                    ),
                  ],
                ),
              ),
            ), // Card
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}
