// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_number_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesNumberModelResponse _$CategoriesNumberModelResponseFromJson(
        Map<String, dynamic> json) =>
    CategoriesNumberModelResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      name: json['name'] as String?,
    );
