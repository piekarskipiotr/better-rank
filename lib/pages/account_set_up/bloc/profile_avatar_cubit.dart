import 'package:betterrank/pages/account_set_up/bloc/profile_avatar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileAvatarCubit extends Cubit<ProfileAvatarState> {
  ProfileAvatarCubit() : super(AvatarChanged());

  XFile? avatar;
  final _imagePicker = ImagePicker();

  void changeAvatar() {
    avatar = null;
    emit(ClearingAvatar());
  }

  Future<dynamic> pickImage({required ImageSource source}) async {
    emit(ChangingAvatar());
    avatar = await _imagePicker.pickImage(
      source: source,
      preferredCameraDevice: CameraDevice.front,
    );

    emit(AvatarChanged());
  }
}
