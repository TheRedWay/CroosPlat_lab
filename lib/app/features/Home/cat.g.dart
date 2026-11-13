// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cat _$CatFromJson(Map<String, dynamic> json) => Cat(
  id: json['id'] as String,
  imageUrl: json['url'] as String,
  breeds:
      (json['breeds'] as List<dynamic>?)
          ?.map((e) => CatBreed.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$CatToJson(Cat instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.imageUrl,
  'breeds': instance.breeds,
};

CatBreed _$CatBreedFromJson(Map<String, dynamic> json) => CatBreed(
  id: json['id'] as String,
  name: json['name'] as String,
  origin: json['origin'] as String? ?? '',
  description: json['description'] as String? ?? '',
  temperament: json['temperament'] as String? ?? '',
  lifeSpan: json['life_span'] as String? ?? '',
);

Map<String, dynamic> _$CatBreedToJson(CatBreed instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'origin': instance.origin,
  'description': instance.description,
  'temperament': instance.temperament,
  'life_span': instance.lifeSpan,
};
