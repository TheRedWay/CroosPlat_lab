import 'package:flutter_test/flutter_test.dart';
import 'package:lab/app/features/Home/bloc/cat_detail_bloc.dart';
import 'package:lab/app/features/Home/cat.dart';
import 'package:lab/app/features/Home/data/cat_detail_repository_interface.dart';

void main() {
  const breed = CatBreed(
    id: 'crex',
    name: 'Cornish Rex',
    origin: 'United Kingdom',
    description: 'A playful cat.',
    temperament: 'Affectionate',
    lifeSpan: '11-15',
  );

  test('loads breed details from repository', () async {
    final repository = _CatDetailRepository(breed: breed);
    final bloc = CatDetailBloc(repository: repository);
    final states = <CatDetailState>[];
    final subscription = bloc.stream.listen(states.add);

    bloc.add(const CatDetailLoad(breedId: 'crex'));
    await bloc.close();
    await subscription.cancel();

    expect(repository.requestedBreedId, 'crex');
    expect(states, [
      isA<CatDetailLoadInProgress>(),
      isA<CatDetailLoadSuccess>().having(
        (state) => state.breed.name,
        'breed name',
        'Cornish Rex',
      ),
    ]);
  });

  test('emits failure when repository request fails', () async {
    final exception = Exception('API unavailable');
    final repository = _CatDetailRepository(exception: exception);
    final bloc = CatDetailBloc(repository: repository);
    final states = <CatDetailState>[];
    final subscription = bloc.stream.listen(states.add);

    bloc.add(const CatDetailLoad(breedId: 'crex'));
    await bloc.close();
    await subscription.cancel();

    expect(states, [
      isA<CatDetailLoadInProgress>(),
      isA<CatDetailLoadFailure>().having(
        (state) => state.exception,
        'exception',
        same(exception),
      ),
    ]);
  });
}

class _CatDetailRepository implements CatDetailRepositoryInterface {
  _CatDetailRepository({this.breed, this.exception});

  final CatBreed? breed;
  final Object? exception;
  String? requestedBreedId;

  @override
  Future<CatBreed> getBreed(String id) async {
    requestedBreedId = id;
    if (exception case final error?) throw error;
    return breed!;
  }
}
