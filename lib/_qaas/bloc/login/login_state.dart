import 'package:equatable/equatable.dart';
import 'package:food_template/_qaas/models/Token.dart';

class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitialState extends LoginState {}
class FacebookLoginSuccess extends LoginState {}
class FacebookLoginFailure extends LoginState {}
class LoginSuccess extends LoginState {
  final Token token;
  LoginSuccess(this.token);
}
class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);
}

class LoginLoading extends LoginState {}




