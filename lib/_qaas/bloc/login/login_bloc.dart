import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/_qaas/bloc/tenants/tenants_bloc.dart';
import 'package:food_template/_qaas/models/RegisterModel.dart';
import 'package:food_template/_qaas/models/Token.dart';

import 'package:food_template/_qaas/network/Api.dart';
import 'package:food_template/_qaas/res/constant.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login_event.dart';
import 'login_state.dart';
import 'package:http/http.dart' as http;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginWithEmailAndPhone)
      yield* _mapLoginToState(event);
    // I added this BLOC
    else if (event is RegisterUser)
      yield* _mapRegisterToState(event);
    else if (event is LoginWithFacebook) {
      yield LoginLoading();
      try {
        // await loginWithFacebook();
        yield FacebookLoginSuccess();
      } catch (_) {
        yield LoginFailure("errorMessage");
      }
    } else if (event is LoginWithGoogle) {
      yield LoginLoading();
      try {
        // yield await loginWithGoogle();
      } catch (error) {
        yield LoginFailure(error);
      }
    } else if (event is LoginWithEmailAndPhone) {
      yield LoginLoading();
    } else if (event is Reset) yield InitialState();
  }

//   loginWithFacebook() async {
//     dynamic _profile;
//
//     try {
//       // by default the login method has the next permissions ['email','public_profile']
//       AccessToken accessToken = await FacebookAuth.instance.login();
//       print(accessToken.toJson());
//       // get the user data
//       final userData = await FacebookAuth.instance.getUserData();
//       print("userData.toString()");
//       print(userData.toString());
//
// //      final token = result.accessToken.token;
//
//       final graphResponse = await http.get(
//           'https://graph.facebook.com/v2.12/me?fields=name,picture.width(500).height(500),first_name,last_name,email&access_token=${accessToken.token}');
//       _profile = json.decode(graphResponse.body);
// //
//       final AuthCredential credential = FacebookAuthProvider.getCredential(
//         accessToken: accessToken.token,
//       );
//
//       // login by facebook but i need also login by email in firebase
//
//       final FirebaseUser user =
//           (await FirebaseAuth.instance.signInWithCredential(credential)).user;
//
//       print('oooo');
//       print(_profile['picture']['data']['url']);
//       print(user.uid == null);
//       print(user.providerId);
//
//       if (user.uid != null)
//         FirebaseMessaging().getToken().then((token) async {
//           print('my fb token is:' + token.toString());
//
//           print(";;;;;;");
//           print(user.displayName);
//           print(_profile.toString());
//         });
//     } on FacebookAuthException catch (e) {
//       switch (e.errorCode) {
//         case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
//           print("You have a previous login operation in progress");
//
//           break;
//         case FacebookAuthErrorCode.CANCELLED:
//           print("login cancelled");
//           break;
//         case FacebookAuthErrorCode.FAILED:
//           print("login failed");
//           break;
//       }
//     }
//   }

//   Future<LoginState> loginWithGoogle() async {
//     String email, uid = '';
//
//     try {
//       final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
//
//       if (googleUser != null) {
//         email = googleUser.email;
//
//         // get token
//         final GoogleSignInAuthentication googleAuth =
//             await googleUser.authentication;
//
//         if (googleAuth.idToken != null && googleAuth.accessToken != null) {
//           final AuthCredential credential = GoogleAuthProvider.getCredential(
//             accessToken: googleAuth.accessToken,
//             idToken: googleAuth.idToken,
//           );
//
//           final FirebaseUser user =
//               (await FirebaseAuth.instance.signInWithCredential(credential))
//                   .user;
//
//           uid = user.uid;
//           /////////////////////////////////////////////////////////////////////////////////
//
//           print('User id : ${user.uid}');
//           print('email id : ${googleUser.email}');
//
//           if (user != null && googleUser != null) {
//             /// Got Firebase User
//
//             /// Show Progress Dialog
//
//             /// Submit to backend
//
//             return LoginFailure('Error from server ');
// //            RegisterRequestModel registerRequest = RegisterRequestModel(
// //                username: uid, email: email, password: '', locationId: '');
// //
// //            RegisterResponseModel result = await _register(registerRequest);
// //
// //
// //            if (result.status == 'success') {
// //              /// go to profile
// //              return LoggedSuccess();
// //            } else
// //
// //              /// Error from server
// //              return LoggedLoginLoginFailure('Error from server ' + result.message);
//           } else {
//             /// firebase error
//             return LoginFailure('Firebase User is null');
//           }
//         }
//       }
//     } catch (Exception) {
//       print('not select google account');
// //      return LoggedLoginLoginFailure(Exception.toString());
//     }
//   }

  Stream<LoginState> _mapRegisterToState(RegisterUser event) async* {
    yield LoginLoading();
    try {
      final bool success =
          await register(email: event.email, password: event.password);
      yield RegisterSuccess();
    } catch (_) {
      yield LoginFailure("error $_");
    }
  }
}

Stream<LoginState> _mapLoginToState(LoginWithEmailAndPhone event) async* {
  yield LoginLoading();
  try {
    final Token token =
        await login(password: event.password, username: event.username);
    yield LoginSuccess(token);
  } catch (_) {
    yield LoginFailure("error $_");
  }
}

Future<Token> login({String username, String password}) async {
  print('login ....');
  final response = await http.post(
      Uri.https(
        Api.BASE_URL_LOGIN,
        '${Api.POST_LOGIN}',
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        'authorization': Api.buildingBasicAuthorization()
      },
      body: {
        "username": "keylife",
        "grant_type": "password",
        "password": "Aa_123456",
        "scope": ""
      });
  print("Requesting ...");
  print(response.request.url);
  print('response.body');
  print(response.body);
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  }
  throw Exception('error');
}

Future<bool> register({String password, String email}) async {
  print('Register ....');
  final response = await http.post(
      Uri.https(
        Api.BASE_URL_LOGIN,
        '${Api.REGISTER}',
      ),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        'authorization': Api.buildingBasicAuthorization()
      },
      body: {
        "email": "$email",
        "password": "$password",
        "locationId": "888348834sjdsdjjssjssd334",
        "Role": "user"
      });
  print("Requesting ...");
  print(response.request.url);
  print('response.body');
  print(response.body);
  if (response.statusCode == 200) {
    return true;
  }
  throw Exception('error');
}

Future<RegisterResponseModel> _register(RegisterRequestModel model) async {
  print('${Api.BASE_URL}${Api.REGISTER}');
  Map<String, dynamic> body = RegisterRequestModel().toMap(model);
//  Map<String, dynamic> body = {
//    "username": "string",
//    "email": "moofiy@a.com",
//    "password": "123456789",
//    "locationId": "5555"
//  };
  print(body.toString());

  var response = await http.post(
      Uri.https(
        Api.BASE_URL,
        '${Api.REGISTER}',
      ),
      headers: Api.buildingBasicAuthorization(),
      body: body);

  print('response....');
  print(RegisterRequestModel().toMap(model).toString());
  print(response.statusCode);

  if (response.statusCode > 200 && response.statusCode < 400) {
    final body = json.decode(response.body);

    RegisterResponseModel registerResponseModel =
        RegisterResponseModel().fromMap(body);

    return registerResponseModel;
  }
}
