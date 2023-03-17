import 'package:equatable/equatable.dart';

abstract class ProfileAvatarState extends Equatable {}

class ChangingAvatar extends ProfileAvatarState {
  @override
  List<Object?> get props => [];
}

class AvatarChanged extends ProfileAvatarState {
  @override
  List<Object?> get props => [];
}

class ClearingAvatar extends ProfileAvatarState {
  @override
  List<Object?> get props => [];
}
