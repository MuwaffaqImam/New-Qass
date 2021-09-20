import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitialState extends LoginState {}
class LoginLoading extends LoginState {}
///////////////////////////////
class FacebookLoggedSuccess extends LoginState {}
class FacebookLoggedFailure extends LoginState {}
///////////////////////////////
class LoggedSuccess extends LoginState {}

class LoggedFailure extends LoginState {
 final String errorMessage;

  LoggedFailure(this.errorMessage);


}