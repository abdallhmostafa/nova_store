import 'package:image_picker/image_picker.dart';
import 'package:nova_store/core/app/upload_image/datasource/upload_image_datasource.dart';
import 'package:nova_store/core/app/upload_image/model/upload_image_response_model.dart';
import 'package:nova_store/core/network/apis/api_error_model.dart';
import 'package:nova_store/core/network/error_handler.dart';
import 'package:nova_store/core/network/network_result.dart';

class UploadImageRepo {
  UploadImageRepo(this._uploadImageDatasource);
  final UploadImageDatasource _uploadImageDatasource;
  Future<NetworkResult<UploadImageResponseModel, ApiErrorModel>> uploadImage({
    required XFile file,
  }) async {
    try {
      final response = await _uploadImageDatasource.uploadImage(file);
      return NetworkResult.success(response);
    } catch (e) {
      return NetworkResult.failure(
        error: ErrorHandler.handleApiError(error: e),
      );
    }
  }
}
