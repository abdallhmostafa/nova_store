
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_number_model_response.g.dart';

@JsonSerializable(createToJson: false)
class ProductNumberModelResponse {
  ProductNumberModelResponse({
    required this.data,
  });
  factory ProductNumberModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductNumberModelResponseFromJson(json);

  final Data? data;

}

@JsonSerializable(createToJson: false)
class Data {
  Data({
    required this.products,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  final List<Product>? products;

}

@JsonSerializable(createToJson: false)
class Product {
  Product({
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  final String? title;
}
