part of 'profile_set_up_bloc.dart';

abstract class ProfileSetUpState extends Equatable {}

class InitialState extends ProfileSetUpState {
  @override
  List<Object?> get props => [];
}

class SettingUp extends ProfileSetUpState {
  @override
  List<Object?> get props => [];
}

class UploadingAvatar extends ProfileSetUpState {
  @override
  List<Object?> get props => [];
}

class UploadingSucceeded extends ProfileSetUpState {
  @override
  List<Object?> get props => [];
}

class UploadingFailed extends ProfileSetUpState {
  @override
  List<Object?> get props => [];
}

class SettingUpSucceeded extends ProfileSetUpState {
  @override
  List<Object?> get props => [];
}

class SettingUpFailed extends ProfileSetUpState {
  SettingUpFailed(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}
