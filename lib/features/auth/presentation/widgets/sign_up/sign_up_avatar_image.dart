import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nova_store/core/common/animation/animate_do.dart';
import 'package:nova_store/core/constants/app_constant.dart';
import 'package:nova_store/core/extensions/context_extention.dart';
import 'package:nova_store/core/utils/app_image_pick.dart';

class SignUpAvatarImage extends StatefulWidget {
  const SignUpAvatarImage({super.key});

  @override
  State<SignUpAvatarImage> createState() => _SignUpAvatarImageState();
}

class _SignUpAvatarImageState extends State<SignUpAvatarImage> {
  XFile? _image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final image = await AppImagePick.pickImage();
        if (image != null) {
          setState(() {
            _image = image;
          });
        }
      },
      child: CustomFadeInDown(
        duration: AppConstant.fadeInDuration,
        child: CircleAvatar(
          radius: 51,
          backgroundColor:
              _image == null ? Colors.transparent : context.color.bluePinkLight,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.5),
            backgroundImage:
                _image != null ? FileImage(File(_image!.path)) : null,
            child: _image != null
                ? null
                : Icon(Icons.add_a_photo, size: 26.w, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
