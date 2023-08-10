import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SafeArea(
      bottom: false,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.contacts_sharp, color: colors.primary),
                  const SizedBox(width: 5),
                  Text(
                    'RickandMorty API',
                    style: titleStyle,
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ))),
    );
  }
}