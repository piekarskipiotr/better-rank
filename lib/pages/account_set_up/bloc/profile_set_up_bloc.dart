import 'package:betterrank/data/repositories/auth_repository.dart';
import 'package:betterrank/data/repositories/cloud_storage_repository.dart';
import 'package:betterrank/data/repositories/firestore_repository.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_avatar_cubit.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_name_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'profile_set_up_event.dart';

part 'profile_set_up_state.dart';

@lazySingleton
class ProfileSetUpBloc extends Bloc<ProfileSetUpEvent, ProfileSetUpState> {
  ProfileSetUpBloc(
    this._firestoreRepository,
    this._cloudStorageRepository,
    this._authRepository,
    this._nameCubit,
    this._avatarCubit,
  ) : super(InitialState()) {
    on<SetUpProfile>((event, emit) async {
      emit(SettingUp());
      try {
        final profileName = _nameCubit.profileName;
        final profileAvatar = _avatarCubit.avatar;
        String? avatarURL;

        if (profileName == null) {
          throw Exception('missing-profile-name');
        }

        await _firestoreRepository
            .addProfileName(profileName)
            .onError((error, stackTrace) {
          _nameCubit.validateProfileName(profileName);
        });

        if (profileAvatar != null) {
          try {
            emit(UploadingAvatar());
            avatarURL = await _cloudStorageRepository.uploadAvatar(
              profileName: profileName,
              image: profileAvatar,
            );

            emit(UploadingSucceeded());
          } catch (e) {
            emit(UploadingFailed());
            throw Exception(e);
          }
        }

        await _authRepository.updateProfile(
          name: profileName,
          avatarURL: avatarURL,
        );

        emit(SettingUpSucceeded());
      } catch (e) {
        emit(SettingUpFailed(e.toString()));
      }
    });
  }

  final FirestoreRepository _firestoreRepository;
  final CloudStorageRepository _cloudStorageRepository;
  final AuthRepository _authRepository;
  final ProfileNameCubit _nameCubit;
  final ProfileAvatarCubit _avatarCubit;
}
