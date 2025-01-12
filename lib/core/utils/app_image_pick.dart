import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_store/core/di/dependency_injection.dart';
import 'package:permission_handler/permission_handler.dart';

class AppImagePick {
  factory AppImagePick() => instance;
  AppImagePick._();
  static final AppImagePick instance = AppImagePick._();
  static Future<XFile?> pickImage({double maxImageSize = 1024}) async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: maxImageSize,
        maxWidth: maxImageSize,
        imageQuality: 50,
        requestFullMetadata: false,
      );
      if (image == null) {
        return null;
      }
      return XFile(image.path);
    } catch (e) {
      final permission = await Permission.phone.status;
      if (permission == PermissionStatus.denied) {
        await _showPermissionDialog();
      }
      return null;
    }
  }

  Future<XFile?> pickImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }
    return XFile(image.path);
  }
}

Future<void> _showPermissionDialog() async {
  return showCupertinoDialog(
    context: serviceLocator<GlobalKey<NavigatorState>>().currentContext!,
    builder: (context) => CupertinoAlertDialog(
      title: const Text('Permission Required'),
      content: const Text('Allow Nova to access your photo library'),
      actions: [
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: const Text('Open Settings'),
          onPressed: () async {
            await openAppSettings();
          },
        ),
      ],
    ),
  );
}
