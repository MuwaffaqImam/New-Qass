import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/_qaas/bloc/login/login_bloc.dart';
import 'package:food_template/_qaas/bloc/login/login_event.dart';
import 'package:food_template/_qaas/bloc/login/login_state.dart';
import 'package:food_template/_qaas/res/constant.dart';
import 'package:food_template/_qaas/res/dimens.dart';
import 'package:food_template/_qaas/res/general.dart';

import 'Confirm_OTP_Screen.dart';
import 'SignIn_Screen.dart';

class signupTemplate1 extends StatefulWidget {
  signupTemplate1({Key key}) : super(key: key);

  @override
  _signupTemplate1State createState() => _signupTemplate1State();
}

class _signupTemplate1State extends State<signupTemplate1> {
  LoginBloc _loginBloc;
  TextEditingController _usernameCon,
      _emailCon,
      _passCon = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (_, state) {
            if (state is LoginSuccess) {
              //go  to profile
            } else if (state is LoginFailure) {
              Future.delayed(Duration(milliseconds: 300), () {
                General.callErrorDialog(context, state.errorMessage);
                _loginBloc.add(Reset());
              });
            }

            return SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: _height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/Template1/image/loginBackground.jpeg"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: _height,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(color: Colors.black12.withOpacity(0.2)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 230.0),
                    child: Container(
                      height: _height,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0)),
                          color: Color(0xFF1E2026)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "Create Account",
                            style: TextStyle(
                                fontFamily: "Sofia",
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 28.0),
                          ),
//                          Padding(
//                            padding: const EdgeInsets.only(
//                                left: 25.0, right: 25.0, top: 40.0),
//                            child: Container(
//                              height: 53.5,
//                              decoration: BoxDecoration(
//                                color: Color(0xFF23252E),
//                                borderRadius:
//                                    BorderRadius.all(Radius.circular(5.0)),
//                                border: Border.all(
//                                  color: Colors.black12,
//                                  width: 0.15,
//                                ),
//                              ),
//                              child: Padding(
//                                padding: const EdgeInsets.only(
//                                    left: 12.0, right: 12.0, top: 5.0),
//                                child: Theme(
//                                  data:
//                                      ThemeData(hintColor: Colors.transparent),
//                                  child: Padding(
//                                    padding: const EdgeInsets.only(left: 10.0),
//                                    child: TextFormField(
//                                      style: new TextStyle(color: Colors.white),
//                                      textAlign: TextAlign.start,
//                                      keyboardType: TextInputType.emailAddress,
//                                      autocorrect: false,
//                                      controller: _usernameCon,
//                                      autofocus: false,
//                                      decoration: InputDecoration(
//                                          border: InputBorder.none,
//                                          contentPadding: EdgeInsets.all(0.0),
//                                          filled: true,
//                                          fillColor: Colors.transparent,
//                                          labelText: 'Username',
//                                          hintStyle:
//                                              TextStyle(color: Colors.white),
//                                          labelStyle: TextStyle(
//                                            color: Colors.white70,
//                                          )),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ),

                          SizedBox(
                            height: Dimens.space40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 15.0),
                            child: Container(
                              height: 53.5,
                              decoration: BoxDecoration(
                                color: Color(0xFF23252E),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 0.15,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, top: 5.0),
                                child: Theme(
                                  data:
                                      ThemeData(hintColor: Colors.transparent),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextFormField(
                                      style: new TextStyle(color: Colors.white),
                                      textAlign: TextAlign.start,
                                      controller: _emailCon,
                                      validator: (text) {
                                        if (text.toString().isEmpty) {
                                          return enter_email;
                                        } else
                                          return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(0.0),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          labelText: 'Email',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          labelStyle: TextStyle(
                                            color: Colors.white70,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25.0, right: 25.0, top: 15.0),
                            child: Container(
                              height: 53.5,
                              decoration: BoxDecoration(
                                color: Color(0xFF23252E),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                border: Border.all(
                                  color: Colors.black12,
                                  width: 0.15,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12.0, top: 5.0),
                                child: Theme(
                                  data:
                                      ThemeData(hintColor: Colors.transparent),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextFormField(
                                      style: new TextStyle(color: Colors.white),
                                      textAlign: TextAlign.start,
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      controller: _passCon,
                                      validator: (text) {
                                        if (text.toString().isEmpty) {
                                          return enter_password;
                                        } else
                                          return null;
                                      },

                                      obscureText: true,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.all(0.0),
                                          filled: true,
                                          fillColor: Colors.transparent,
                                          labelText: 'Password',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          labelStyle: TextStyle(
                                            color: Colors.white70,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 40.0),
                            child: InkWell(
                              onTap: () {


                                if (_formKey.currentState.validate())

                                  _loginBloc.add(RegisterUser(
                                    _emailCon.text.toString(),
                                    _passCon.text.toString(),
                                  ));

//                               Navigator.of(context).pushReplacement(
//                                   PageRouteBuilder(
//                                       pageBuilder: (_, __, ___) =>
//                                           ConfirmOtpPage()));
                              },
                              child: Container(
                                height: 52.0,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(80.0),
                                  gradient: LinearGradient(colors: [
                                    Color(0xFFFEE140),
                                    Color(0xFFFA709A),
                                  ]),
                                ),
                                child: Center(
                                    child: Text(
                                  "Signup",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Sofia",
                                      letterSpacing: 0.9),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
//                    InkWell(
//                      onTap: () {
//                        Navigator.of(context).pushReplacement(PageRouteBuilder(
//                            pageBuilder: (_, __, ___) => signinTemplate1()));
//                      },
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        children: <Widget>[
//                          Text(
//                            "Have an account?",
//                            style: TextStyle(
//                                fontFamily: "Sofia",
//                                color: Colors.white,
//                                fontWeight: FontWeight.w200,
//                                fontSize: 15.0),
//                          ),
//                          Text(" Signin",
//                              style: TextStyle(
//                                  fontFamily: "Sofia",
//                                  color: Color(0xFFFA709A),
//                                  fontWeight: FontWeight.w300,
//                                  fontSize: 15.0))
//                        ],
//                      ),
//                    ),
                        ],
                      ),
                    ),
                  ),
                  state is LoginLoading
                      ? Center(child: CircularProgressIndicator())
                      : Container()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
