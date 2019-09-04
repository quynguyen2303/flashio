import 'dart:io';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashio/repositories/AuthenticationRepository.dart';
import 'package:flashio/repositories/StorageRepository.dart';
import 'package:flashio/repositories/UserDataRepository.dart';
import './bloc.dart';
import 'authentication_state.dart';
import 'authentication_event.dart';
import '../../models/user.dart';
import '../../config/Paths.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final AuthenticationRepository authenticationRepository;
  final UserDataRepository userDataRepository;
  final StorageRepository storageRepository;

  AuthenticationBloc({
    this.authenticationRepository,
    this.userDataRepository,
    this.storageRepository,
  }) : assert(authenticationRepository != null),
  assert(userDataRepository != null),
  assert(storageRepository != null);


  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    print(event);
    if (event is AppLaunched) {
      yield* mapAppLaunchedToState();
    } else if (event is ClickedGoogleLogin) {
      yield* mapClickedGoogleLoginToState();
    } else if (event is LoggedIn) {
      yield* mapLoggedInToState(event.user);
    } else if (event is PickedProfilePicture) {
      yield ReceivedProfilePicture(event.file);
    } else if (event is SaveProfile) {
      yield* mapSaveProfileToState(
          event.profileImage, event.age, event.username);
    } else if (event is ClickedLogout) {
      yield* mapLoggedOutToState();
    }
  }
      
  Stream<AuthenticationState> mapAppLaunchedToState() async* {
    try {
      yield AuthInProgress(); // show progress bar
      final isSignedIn = await authenticationRepository.isLoggedIn(); // check if user already signed in
      if (isSignedIn) {
        final user = await authenticationRepository.getCurrentUser();
        bool isProfileComplete = await userDataRepository.isProfileComplete(user.uid); // if signed in check if the profile is completed
        print(isProfileComplete);
        if (isProfileComplete) {
          yield ProfileUpdated(); // profile completed redirect to the home page
        } else {
          yield Authenticated(user);
          dispatch(LoggedIn(user));
        }
      } else {
        yield UnAuthenticated(); // not signed in, show the sign in page
      }
    } catch (_, stacktrace) {
      print(stacktrace);
      yield UnAuthenticated();
    }
  }

  Stream<AuthenticationState> mapClickedGoogleLoginToState() async* {
    yield AuthInProgress(); // show progress bar
    try {
      FirebaseUser firebaseUser = await authenticationRepository.signInWithGoogle(); // show the google auth prompt, retrieve the selected account
      bool isProfileComplete = await userDataRepository.isProfileComplete(firebaseUser.uid);
      print(isProfileComplete);
      if (isProfileComplete) {
        yield ProfileUpdated(); // profile completed go to the home page
      } else {
        yield Authenticated(firebaseUser); // redirect to profile page to complete profile
        dispatch(LoggedIn(firebaseUser)); // also send the LoggedIn event so the data from google auth can be prefilled
      }
    } catch (_, stacktrace) {
      print(stacktrace);
      yield UnAuthenticated();
    }
  }

  Stream<AuthenticationState> mapLoggedInToState(FirebaseUser firebaseUser) async* {
    yield ProfileUpdateInProgress(); // show progress bar
    User user = await userDataRepository.saveDetailsFromGoogleAuth(firebaseUser); // save the gAuth to firestore database
    yield PreFillData(user); // prefill the gAuth data in the form
  } 

  Stream<AuthenticationState> mapSaveProfileToState(
      File profileImage, int age, String username) async* {
    yield ProfileUpdateInProgress(); // shows progress bar
    String profilePictureUrl = await storageRepository.uploadImage(
        profileImage, Paths.profilePicturePath); // upload image to firebase storage
    FirebaseUser user = await authenticationRepository.getCurrentUser(); // retrieve user from firebase
    await userDataRepository.saveProfileDetails(
        user.uid, profilePictureUrl, age, username); // save profile details to firestore
    yield ProfileUpdated(); //redirect to home page
  }

  Stream<AuthenticationState> mapLoggedOutToState() async* {
    yield UnAuthenticated(); // redirect to login page
    authenticationRepository.signOutUser(); // terminate session
  }
}
