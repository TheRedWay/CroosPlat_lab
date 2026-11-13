import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab/app/features/Home/bloc/home_bloc.dart';
import 'package:lab/app/features/Home/cat.dart';
import 'package:lab/di/di.dart';

import '../../widgets/content_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(const HomeLoad()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Аренда котиков')),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) => switch (state) {
            HomeInitial() => const SizedBox.shrink(),
            HomeLoadInProgress() => const Center(
              child: CircularProgressIndicator(),
            ),
            HomeLoadSuccess(:final cats) => _buildHomeLoadSuccess(
              context,
              cats,
            ),
            HomeLoadFailure(:final exception) => _buildHomeLoadFailure(
              context,
              exception,
            ),
          },
        ),
      ),
    );
  }

  Widget _buildHomeLoadSuccess(BuildContext context, List<Cat> cats) {
    return SingleChildScrollView(
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
    );
  }

  Widget _buildHomeLoadFailure(BuildContext context, Object exception) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Не удалось загрузить данные: $exception'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.read<HomeBloc>().add(const HomeLoad()),
              child: const Text('Повторить'),
            ),
          ],
        ),
      ),
    );
  }
}
