

import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginWithFacebook extends LoginEvent {}
class LoginWithGoogle extends LoginEvent {}