import 'package:flutter_perpus/modules/profile/src/models/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final Profile profile;
  ProfileSuccess({required this.profile});
}

class ProfileFailure extends ProfileState {
  final String message;
  ProfileFailure({required this.message});
}
