import 'package:flutter/material.dart';

class CustomBottomNavigaton extends StatelessWidget {
  const CustomBottomNavigaton({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined), label: 'Characters'),
      BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined), label: 'Locations'),
      BottomNavigationBarItem(
          icon: Icon(Icons.eight_k_plus_outlined), label: 'Episodes'),
    ]);
  }
}
