

import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoginWithFacebook extends LoginEvent {}
class LoginWithGoogle extends LoginEvent {}
class LoginWithEmailAndPhone extends LoginEvent {
  final String email,password,username;
  LoginWithEmailAndPhone(this.email, this.password,this.username);
}
class Reset extends LoginEvent {}

