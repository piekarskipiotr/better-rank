import 'package:equatable/equatable.dart';

abstract class ProfileNameState extends Equatable {}

class ProfileNameValidated extends ProfileNameState {
  @override
  List<Object?> get props => [];
}

class ValidatingProfileName extends ProfileNameState {
  @override
  List<Object?> get props => [];
}
