import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab/app/features/Home/bloc/cat_detail_bloc.dart';
import 'package:lab/app/features/Home/cat.dart';
import 'package:lab/di/di.dart';

class CatDetailScreen extends StatelessWidget {
  const CatDetailScreen({required this.cat, super.key});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<CatDetailBloc>()..add(CatDetailLoad(breedId: cat.breed.id)),
      child: Scaffold(
        appBar: AppBar(title: Text(cat.breed.name)),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    cat.imageUrl,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    errorBuilder: (_, _, _) => const Icon(Icons.broken_image),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  cat.breed.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 16),
              BlocBuilder<CatDetailBloc, CatDetailState>(
                builder: (context, state) => switch (state) {
                  CatDetailInitial() => const SizedBox.shrink(),
                  CatDetailLoadInProgress() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  CatDetailLoadSuccess(:final breed) => _buildBreedDetails(
                    breed,
                  ),
                  CatDetailLoadFailure(:final exception) => _buildLoadFailure(
                    context,
                    exception,
                  ),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBreedDetails(CatBreed breed) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _DetailRow(label: 'Порода', value: breed.name),
        _DetailRow(label: 'Страна происхождения', value: breed.origin),
        _DetailRow(label: 'Продолжительность жизни', value: breed.lifeSpan),
        _DetailRow(label: 'Характер', value: breed.temperament),
        _DetailRow(label: 'Описание', value: breed.description),
      ],
    );
  }

  Widget _buildLoadFailure(BuildContext context, Object exception) {
    return Center(
      child: Column(
        children: [
          Text('Не удалось загрузить данные: $exception'),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () => context.read<CatDetailBloc>().add(
              CatDetailLoad(breedId: cat.breed.id),
            ),
            child: const Text('Повторить'),
          ),
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        width: double.infinity,
        child: Text.rich(
          TextSpan(
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              TextSpan(
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
