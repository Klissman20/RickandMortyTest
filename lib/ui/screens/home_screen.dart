import 'package:flutter/material.dart';
import 'package:rick_n_morty_test/ui/widgets/shared/custom_app_bar.dart';
import 'package:rick_n_morty_test/ui/widgets/shared/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final Widget childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(flexibleSpace: const CustomAppBar()),
        body: childView,
        bottomNavigationBar: const CustomBottomNavigaton());
  }
}
