import 'dart:developer';

import 'package:betterrank/common/helpers/permissions_helper.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_avatar_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class ProfileAvatarCubit extends Cubit<ProfileAvatarState> {
  ProfileAvatarCubit() : super(AvatarChanged());

  XFile? avatar;
  final _imagePicker = ImagePicker();

  void changeAvatar() {
    avatar = null;
    emit(ClearingAvatar());
  }

  Future<dynamic> pickImage({
    required BuildContext context,
    required ImageSource source,
  }) async {
    emit(ChangingAvatar());
    try {
      final perms = _getPermissionsList(source: source);
      await PermissionHelper.checkPermission(
        context: context,
        permissions: perms,
      );

      avatar = await _imagePicker.pickImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
      );
    } catch (e) {
      avatar = null;
      log(e.toString());
    }

    emit(AvatarChanged());
  }

  List<Permission> _getPermissionsList({required ImageSource source}) {
    switch (source) {
      case ImageSource.camera:
        return [Permission.camera];
      case ImageSource.gallery:
        return [Permission.photos];
    }
  }
}
