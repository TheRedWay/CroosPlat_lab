import 'package:flutter/material.dart';

import '../../widgets/content_card.dart';
import 'cat.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Аренда котиков')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Выберите котика',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              itemCount: cats.length,
              itemBuilder: (_, index) => ContentCard(cat: cats[index]),
              separatorBuilder: (_, _) => const SizedBox(height: 16),
            ),
          ],
        ),
      ),
    );
  }
}
