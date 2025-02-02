
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_number_model_response.g.dart';

@JsonSerializable(createToJson: false)
class CategoriesNumberModelResponse {
  CategoriesNumberModelResponse({
    required this.data,
  });

  factory CategoriesNumberModelResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoriesNumberModelResponseFromJson(json);
  final Data? data;

}

@JsonSerializable(createToJson: false)
class Data {
  Data({
    required this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  final List<Category>? categories;

}

@JsonSerializable(createToJson: false)
class Category {
  Category({
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  final String? name;
}
