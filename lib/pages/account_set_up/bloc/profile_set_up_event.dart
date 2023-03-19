part of 'profile_set_up_bloc.dart';

abstract class ProfileSetUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class UploadAvatar extends ProfileSetUpEvent {}

class SetUpProfile extends ProfileSetUpEvent {}
