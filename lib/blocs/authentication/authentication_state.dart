import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'dart:io';
import '../../models/user.dart';


@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super();
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';

  @override
  List<Object> get props => [];
}

class AuthInProgress extends AuthenticationState {
  @override
  String toString() => 'AuthInProgress';

  @override
  List<Object> get props => [];
}

class Authenticated extends AuthenticationState {
  final FirebaseUser user;
  Authenticated(this.user);
  @override
  String toString() => 'Authenticated';

  @override
  List<Object> get props => [];
}

class PreFillData extends AuthenticationState {
  final User user;
  PreFillData(this.user);
  @override
  String toString() => 'PreFillData';

  @override
  List<Object> get props => [];
}

class UnAuthenticated extends AuthenticationState {
  @override
  String toString() => 'UnAuthenticated';

  @override
  List<Object> get props => [];
}

class ReceivedProfilePicture extends AuthenticationState {
  final File file;
  ReceivedProfilePicture(this.file);
  @override
  String toString() => 'ReceivedProfilePicture';

  @override
  List<Object> get props => [];
}

class ProfileUpdateInProgress extends AuthenticationState {
  @override
  String toString() => 'ProfileUpdateInProgress'; 

  @override
  List<Object> get props => [];
}

class ProfileUpdated extends AuthenticationState {
  @override
  String toString() => 'ProfileComplete';

  @override
  List<Object> get props => [];
}
  
// class InitialAuthenticationState extends AuthenticationState {}
