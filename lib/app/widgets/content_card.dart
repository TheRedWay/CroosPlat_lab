import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lab/app/features/Home/cat.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({required this.cat, super.key});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    final imageSize = 100.0;
    return InkWell(
      onTap: () => context.push('/cats/${cat.id}', extra: cat),
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: imageSize,
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                cat.imageUrl,
                height: imageSize,
                width: imageSize,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
              ),
            ),
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cat.breed.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Expanded(
                    child: Text(
                      cat.breed.temperament,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
