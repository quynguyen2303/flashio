import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/Palette.dart';

import 'pages/RegisterPage.dart';
import 'pages/ConversationPageSlide.dart';

import 'blocs/authentication/bloc.dart';

import 'repositories/AuthenticationRepository.dart';
import 'repositories/UserDataRepository.dart';
import 'repositories/StorageRepository.dart';

void main() {
  // create instances of the repositories to supply to the app
  final AuthenticationRepository authRepository = AuthenticationRepository();
  final UserDataRepository userDataRepository = UserDataRepository();
  final StorageRepository storageRepository = StorageRepository();
  runApp(BlocProvider(
      builder: (context) => AuthenticationBloc(
            authenticationRepository: authRepository,
            userDataRepository: userDataRepository,
            storageRepository: storageRepository,
          )..dispatch(AppLaunched()),
      child: Flashio()));
}

class Flashio extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flashio Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is UnAuthenticated) {
            return RegisterPage();
          } else if (state is ProfileUpdated) {
            return ConversationPageSlide();
          } else {
            return RegisterPage();
          }
        },
      ),
    );
  }
}
