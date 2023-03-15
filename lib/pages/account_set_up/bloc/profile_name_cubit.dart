import 'dart:async';
import 'package:betterrank/data/repositories/auth_repository.dart';
import 'package:betterrank/data/repositories/firestore_repository.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_name_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileNameCubit extends Cubit<ProfileNameState> {
  ProfileNameCubit(
    this._authRepository,
    this._firestoreRepository,
  ) : super(ProfileNameValidated()) {
    profileName = _authRepository.getCurrentUser()?.displayName;
  }

  final FirestoreRepository _firestoreRepository;
  final AuthRepository _authRepository;
  Timer? _debounce;

  String? profileName;
  bool? isValid;

  Future<dynamic> validateProfileName(String? name) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () async {
      profileName = name;
      isValid = null;

      try {
        emit(ValidatingProfileName());
        if (name != null && name.isNotEmpty) {
          await _firestoreRepository.isProfileNameExists(name).then(
                (exists) => isValid = !exists,
              );
        }
      } catch (_) {
        isValid = false;
      }

      emit(ProfileNameValidated());
    });
  }
}
