import 'package:flutter/material.dart';

import 'cat.dart';

class CatDetailScreen extends StatelessWidget {
  const CatDetailScreen({required this.cat, super.key});

  final Cat cat;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: Text(cat.name)),

      body: SingleChildScrollView
      (

        padding: const EdgeInsets.all(16),
        child: Column
        (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [
            ConstrainedBox
            (
              constraints: const BoxConstraints(maxWidth: 560),
              child: ClipRRect
              (
                borderRadius: BorderRadius.circular(20),
                child: Image.asset
                (
                  cat.imagePath,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 20), // отступ 20
            SizedBox
            (
              width: double.infinity,
              child: Text
              (
                cat.name,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 16), // отступ 16
            _DetailRow(label: 'Порода', value: cat.breed),
            _DetailRow(label: 'Пол', value: cat.gender),
            _DetailRow(label: 'Возраст', value: cat.age),
            _DetailRow(label: 'Цена', value: '${cat.pricePerHour}₽/час'),
            _DetailRow(label: 'Характер', value: cat.personality),
            _DetailRow(label: 'Особый уход', value: cat.specialCare),
            _DetailRow(label: 'Любимые занятия', value: cat.favoriteActivities),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget 
{
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) 
  {
    return Padding
    (

      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox
      (
        width: double.infinity,
        child: Text.rich
        (
          TextSpan
          (
            style: Theme.of(context).textTheme.bodyLarge,
            children: 
            [
              TextSpan
              (
                text: '$label: ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: value),
            ],
          ),
        ),
      ),
    );
  }
}
