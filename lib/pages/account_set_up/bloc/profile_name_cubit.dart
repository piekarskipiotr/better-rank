import 'dart:async';

import 'package:betterrank/data/repositories/auth_repository.dart';
import 'package:betterrank/pages/account_set_up/bloc/profile_name_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileNameCubit extends Cubit<ProfileNameState> {
  ProfileNameCubit(this._authRepository) : super(ProfileNameValidated()) {
    profileName = _authRepository.getCurrentUser()?.displayName;
  }

  final AuthRepository _authRepository;
  Timer? _debounce;

  String? profileName;
  bool? isValid;

  Future<dynamic> validateProfileName(String? name) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () async {
      isValid = null;

      emit(ValidatingProfileName());
      profileName = name;
      isValid = (profileName?.length ?? 0).isOdd;

      await Future<dynamic>.delayed(const Duration(seconds: 1));
      emit(ProfileNameValidated());
    });
  }
}
