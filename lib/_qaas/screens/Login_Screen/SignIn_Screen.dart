import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/_qaas/bloc/login/login_bloc.dart';
import 'package:food_template/_qaas/bloc/login/login_event.dart';
import 'package:food_template/_qaas/bloc/login/login_state.dart';
import 'package:food_template/_qaas/res/constant.dart';
import 'package:food_template/_qaas/res/general.dart';
import 'package:food_template/_qaas/screens/common/dialog/error_dialog.dart';
import 'Confirm_OTP_Screen.dart';
import 'Signup_Screen.dart';
import 'package:crypto/crypto.dart';

class signinPhoneTemplate1 extends StatefulWidget {
  signinPhoneTemplate1({Key key}) : super(key: key);

  @override
  _signinPhoneTemplate1State createState() => _signinPhoneTemplate1State();
}

class _signinPhoneTemplate1State extends State<signinPhoneTemplate1> {
  LoginBloc _loginBloc;
  TextEditingController _phoneCon = TextEditingController();
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
    return BlocBuilder(
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

          return Form(
            key: _formKey,
            child: Scaffold(
              body: SingleChildScrollView(
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
                      padding: const EdgeInsets.only(top: 300.0),
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
                              "Login With Phone",
                              style: TextStyle(
                                  fontFamily: "Sofia",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 40.0),
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
                                    data: ThemeData(
                                        hintColor: Colors.transparent),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: TextFormField(
                                        controller: _phoneCon,
                                        style:
                                            new TextStyle(color: Colors.white),
                                        textAlign: TextAlign.start,
                                        validator: (text) {
                                          if (text.toString().isEmpty) {
                                            return enter_phone;
                                          } else
                                            return null;
                                        },
                                        keyboardType: TextInputType.phone,
                                        autocorrect: false,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.all(0.0),
                                            filled: true,
                                            fillColor: Colors.transparent,
                                            labelText: 'Phone',
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
//                            Padding(
//                              padding: const EdgeInsets.only(
//                                  left: 25.0, right: 25.0, top: 15.0),
//                              child: Container(
//                                height: 53.5,
//                                decoration: BoxDecoration(
//                                  color: Color(0xFF23252E),
//                                  borderRadius:
//                                      BorderRadius.all(Radius.circular(5.0)),
//                                  border: Border.all(
//                                    color: Colors.black12,
//                                    width: 0.15,
//                                  ),
//                                ),
//                                child: Padding(
//                                  padding: const EdgeInsets.only(
//                                      left: 12.0, right: 12.0, top: 5.0),
//                                  child: Theme(
//                                    data: ThemeData(
//                                        hintColor: Colors.transparent),
//                                    child: Padding(
//                                      padding:
//                                          const EdgeInsets.only(left: 10.0),
//                                      child: TextFormField(
//                                        style:
//                                            new TextStyle(color: Colors.white),
//                                        textAlign: TextAlign.start,
//                                        controller: _passCon,
//                                        validator: (text) {
//                                          if (text.toString().isEmpty) {
//                                            return enter_password;
//                                          } else
//                                            return null;
//                                        },
//                                        keyboardType:
//                                            TextInputType.emailAddress,
//                                        autocorrect: false,
//                                        autofocus: false,
//                                        obscureText: true,
//                                        decoration: InputDecoration(
//                                            border: InputBorder.none,
//                                            contentPadding: EdgeInsets.all(0.0),
//                                            filled: true,
//                                            fillColor: Colors.transparent,
//                                            labelText: 'Password',
//                                            hintStyle:
//                                                TextStyle(color: Colors.white),
//                                            labelStyle: TextStyle(
//                                              color: Colors.white70,
//                                            )),
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, top: 64.0),
                              child: InkWell(
                                onTap: () {


                                  if (_formKey.currentState.validate()) {

                                    print(_phoneCon.text.toString());
                                    _loginBloc.add(LoginWithEmailAndPhone(
                                        _phoneCon.text.toString(),
                                        sha256
                                            .convert(utf8.encode(_phoneCon.text
                                            .toString())).toString(),
                                        ''));
                                  }

//

//                                  Navigator.of(context).pushReplacement(
//                                PageRouteBuilder(
//                                    pageBuilder: (_, __, ____) =>
//                                        ConfirmOtpPage()));
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
                                    "Confirm",
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

}
