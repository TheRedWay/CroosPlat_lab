import 'package:json_annotation/json_annotation.dart';

part 'cat.g.dart';

@JsonSerializable()
class Cat {
  const Cat({required this.id, required this.imageUrl, required this.breeds});

  final String id;

  @JsonKey(name: 'url')
  final String imageUrl;

  @JsonKey(defaultValue: <CatBreed>[])
  final List<CatBreed> breeds;

  CatBreed get breed => breeds.first;

  String get listingDescription => '${breed.name}, ${breed.origin}';

  factory Cat.fromJson(Map<String, dynamic> json) => _$CatFromJson(json);

  Map<String, dynamic> toJson() => _$CatToJson(this);
}

@JsonSerializable()
class CatBreed {
  const CatBreed({
    required this.id,
    required this.name,
    required this.origin,
    required this.description,
    required this.temperament,
    required this.lifeSpan,
  });

  final String id;
  final String name;

  @JsonKey(defaultValue: '')
  final String origin;

  @JsonKey(defaultValue: '')
  final String description;

  @JsonKey(defaultValue: '')
  final String temperament;

  @JsonKey(name: 'life_span', defaultValue: '')
  final String lifeSpan;

  factory CatBreed.fromJson(Map<String, dynamic> json) =>
      _$CatBreedFromJson(json);

  Map<String, dynamic> toJson() => _$CatBreedToJson(this);
}
