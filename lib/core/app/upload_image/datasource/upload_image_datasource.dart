import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_store/core/app/upload_image/model/upload_image_response_model.dart';
import 'package:nova_store/core/network/api_service.dart';

class UploadImageDatasource {
  UploadImageDatasource(this._apiService);
  final ApiService _apiService;
  Future<UploadImageResponseModel> uploadImage(XFile file) async {
    final formData = await _convertXFileToFormData(file);
    final response = await _apiService.uploadImage(formData);
    return response;
  }

  Future<FormData> _convertXFileToFormData(XFile file) async {
    final formData = FormData();

    formData.files
        .add(MapEntry('file', await MultipartFile.fromFile(file.path)));
    return formData;
  }
}
