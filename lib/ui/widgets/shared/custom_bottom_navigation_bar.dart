import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigaton extends StatelessWidget {
  const CustomBottomNavigaton({super.key});

  int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).matchedLocation;

    switch (location) {
      case '/character':
        return 0;
      case '/location':
        return 1;
      case '/episodes':
        return 2;
      default:
        return 0;
    }
  }

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/character');
        break;
      case 1:
        context.go('/location');
        break;
      case 2:
        context.go('/episodes');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: getCurrentIndex(context),
        onTap: (index) => onItemTapped(context, index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Characters'),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: 'Locations'),
          BottomNavigationBarItem(
              icon: Icon(Icons.eight_k_plus_outlined), label: 'Episodes'),
        ]);
  }
}
