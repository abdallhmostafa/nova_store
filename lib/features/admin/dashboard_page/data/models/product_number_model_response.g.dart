// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_number_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductNumberModelResponse _$ProductNumberModelResponseFromJson(
        Map<String, dynamic> json) =>
    ProductNumberModelResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      title: json['title'] as String?,
    );
