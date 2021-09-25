import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/_qaas/bloc/login/login_bloc.dart';
import 'package:food_template/_qaas/bloc/login/login_event.dart';
import 'package:food_template/_qaas/bloc/login/login_state.dart';
import 'package:food_template/_qaas/locale/LocaleManager.dart';
import 'package:food_template/_qaas/locale/RouterManager.dart';
import 'package:food_template/_qaas/res/Fonts.dart';
import 'package:food_template/_qaas/res/constant.dart';
import 'package:food_template/_qaas/res/dimens.dart';
import 'package:food_template/_qaas/res/general.dart';

import '../LoginScreen.dart';
import 'Confirm_OTP_Screen.dart';
import 'SignIn_Screen.dart';

class signupTemplate1 extends StatefulWidget {
  signupTemplate1({Key key}) : super(key: key);

  @override
  _signupTemplate1State createState() => _signupTemplate1State();
}

class _signupTemplate1State extends State<signupTemplate1> {
  TextEditingController _emailCon = TextEditingController();
  TextEditingController _passCon = TextEditingController();
  Rout route = Rout.MAIN_SCREEN;
  final _formKey = GlobalKey<FormState>();
  Rout routTo;

  _signupTemplate1State();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildScreen();
  }

  Form buildScreen() {
    double _height = MediaQuery.of(context).size.height;
    return Form(
      key: _formKey,
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (_, state) {
            if (state is RegisterSuccess) {
              Future.delayed(Duration(milliseconds: 500), () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('تم تسجيل الدخول في نجاح')));
                Navigator.of(context).pop();
              });
            } else if (state is LoginFailure) {
              Future.delayed(Duration(milliseconds: 300), () {
                General.callErrorDialog(context, state.errorMessage);
                BlocProvider.of<LoginBloc>(context).add(Reset());
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
                          LocalManager.translate(word:   "قم بإنشاء الحساب"),
                            style: TextStyle(
                                fontFamily: Fonts.elMessriFamily,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 28.0),
                          ),
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
                                          labelText: LocalManager.translate(word: 'الإيميل'),
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
                                          labelText: LocalManager.translate(word: 'كلمة السر'),
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
                                  BlocProvider.of<LoginBloc>(context)
                                      .add(RegisterUser(
                                    _emailCon.text.toString(),
                                    _passCon.text.toString(),
                                  ));
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
                                  "إنشاء حساب",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: Fonts.tajwalFamily,
                                      letterSpacing: 0.9),
                                )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(LoginScreen.getRoute());

                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    LocalManager.translate(word: 'تمتلك حساب ؟ إذهب إلى'),
                                    style: TextStyle(
                                        fontFamily: Fonts.tajwalFamily,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                        fontSize: 15.0),
                                  ),
                                  Text(
                                  LocalManager.translate(word: ' تسجيل الدخول'),
                                      style: TextStyle(
                                          fontFamily: Fonts.tajwalFamily,
                                          color: Color(0xFFFA709A),
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15.0))
                                ],
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
