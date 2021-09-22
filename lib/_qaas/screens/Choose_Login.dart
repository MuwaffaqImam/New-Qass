import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/Screen/Template1/Login_Screen/SignIn_Screen.dart';
import 'package:food_template/_qaas/bloc/login/login_bloc.dart';
import 'package:food_template/_qaas/bloc/login/login_event.dart';
import 'package:food_template/_qaas/bloc/login/login_state.dart';
import 'package:food_template/_qaas/res/constant.dart';
import 'package:food_template/_qaas/res/dimens.dart';
import 'package:food_template/_qaas/res/general.dart';
import 'package:food_template/_qaas/screens/Login_Screen/SignIn_Screen.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:food_template/Screen/Template4/Style/ThemeT4.dart' as Style;

import 'Login_Screen/Signup_Screen.dart';
import 'common/dialog/error_dialog.dart';

class chooseLogin extends StatefulWidget {
  chooseLogin({Key key}) : super(key: key);

  @override
  _chooseLoginState createState() => _chooseLoginState();
}

class _chooseLoginState extends State<chooseLogin>
    with TickerProviderStateMixin {
  TextEditingController emailController, passwordController;
  final _formKey = GlobalKey<FormState>();

  /// Declare Animation
  AnimationController animationController;
  var tapLogin = 0;
  var tapSignup = 0;
  LoginBloc _loginBloc;
  ProgressDialog pr;

  @override

  /// Declare animation in initState
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);

    emailController = TextEditingController();
    passwordController = TextEditingController();
    pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, isDismissible: false, showLogs: true);

    // TODO: implement initState
    /// Animation proses duration
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tapLogin = 0;
                tapSignup = 0;
              });
            }
          });
    super.initState();
  }

  /// To dispose animation controller
  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  /// Play animation set forward reverse
  Future<Null> _Playanimation() async {
    try {
      await animationController.forward();
      await animationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    mediaQuery.devicePixelRatio;
    mediaQuery.size.height;
    mediaQuery.size.width;
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<LoginBloc, LoginState>(
            bloc: _loginBloc,
            builder: (_, state) {
              if (state is LoggedSuccess) {
                //go  to profile
              } else if (state is LoggedFailure) {
                Future.delayed(Duration(milliseconds: 300), () {
                  General.callErrorDialog(context, state.errorMessage);
                  _loginBloc.add(Reset());
                });
              }

              return Stack(
                children: <Widget>[
                  ///
                  /// Set background video
                  ///
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/Template1/image/chosseBackground.jpeg"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                      height: double.infinity,
                      child: Container(
                        margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: FractionalOffset(0.0, 0.0),
                            end: FractionalOffset(0.0, 1.0),
                            // stops: [0.0, 1.0],
                            colors: <Color>[
//                          Color(0xFF1E2026).withOpacity(0.1),
//                          Color(0xFF1E2026).withOpacity(0.3),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),

                        /// Set component layout
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 40.0),
                                  child: Container(
                                    height: 53.5,
                                    child: TextFormField(
                                      style: new TextStyle(color: Colors.white),
                                      textAlign: TextAlign.start,
                                      validator: (text) {
                                        if (text.toString().isEmpty) {
                                          return enter_email;
                                        } else
                                          return null;
                                      },
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      autofocus: false,
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        labelText: "Enter Email",
                                        labelStyle:
                                            TextStyle(color: Colors.white70),
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          borderSide: BorderSide(
                                            color: Colors.white54,
                                            width: 2.0,
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
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 0.0, right: 0.0, top: 5.0),
                                      child: TextFormField(
                                        style:
                                            new TextStyle(color: Colors.white),
                                        textAlign: TextAlign.start,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        autocorrect: false,
                                        autofocus: false,
                                        obscureText: true,
                                        validator: (text) {
                                          if (text.toString().isEmpty) {
                                            return enter_password;
                                          } else
                                            return null;
                                        },
                                        controller: passwordController,
                                        decoration: InputDecoration(
                                          labelText: "Enter Password",
                                          labelStyle:
                                              TextStyle(color: Colors.white70),
                                          fillColor: Colors.white,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            borderSide: BorderSide(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            borderSide: BorderSide(
                                              color: Colors.white54,
                                              width: 2.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: Dimens.space20,
                                ),
                                tapLogin == 0
                                    ? Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          splashColor: Colors.white,
                                          onTap: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              print('hhhhhhhhhhh');
                                              print(emailController.text);

                                              _loginBloc.add(
                                                  LoginWithEmailAndPhone(
                                                      emailController
                                                          .text
                                                          .toString(),
                                                      passwordController.text
                                                          .toString(),
                                                      ''));
                                            }
//

//
                                          },
                                          child: ButtonCustom(
                                            txt: "Login",
                                            gradient1: Color(0xFFFEE140),
                                            gradient2: Color(0xFFFA709A),
                                            border: Colors.transparent,
                                          ),
                                        ),
                                      )
                                    : AnimationSplashSignup(
                                        animationController:
                                            animationController.view,
                                      ),
                                Padding(padding: EdgeInsets.only(top: 15.0)),
                                SizedBox(
                                  height: Dimens.space40,
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.white,
                                      onTap: () {
//                                          setState(() {
//                                            tapLogin = 1;
//                                          });
//                                          _Playanimation();
//                                          return tapLogin;

                                        Navigator.of(context).push(PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                BlocProvider(
                                                    create: (context) =>
                                                        LoginBloc(
                                                            InitialState()),
                                                    child:
                                                        new signinPhoneTemplate1())));
                                      },
                                      child: ButtonCustom(
                                        txt: "Login with Phone",
                                        gradient1: Colors.white24,
                                        gradient2: Colors.white,
                                        border: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      splashColor: Colors.white,
                                      onTap: () {
                                        _loginBloc.add(LoginWithGoogle());

//
                                      },
                                      child: ButtonCustom(
                                        txt: "Connect with Google",
                                        gradient1: Colors.red,
                                        gradient2: Colors.redAccent,
                                        border: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        PageRouteBuilder(
                                            pageBuilder: (_, __, ___) =>
                                                BlocProvider(
                                                    create: (context) =>
                                                        LoginBloc(
                                                            InitialState()),
                                                    child:
                                                        new signupTemplate1())));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Don't have an account?",
                                        style: TextStyle(
                                            fontFamily: "Sofia",
                                            color: Colors.white,
                                            fontWeight: FontWeight.w200,
                                            fontSize: 15.0),
                                      ),
                                      Text(" Signup",
                                          style: TextStyle(
                                              fontFamily: "Sofia",
                                              color: Color(0xFFFA709A),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15.0))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),

                  state is LoginLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Style.Colors.mainColor),
                          ),
                        )
                      : Container()
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _loading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              new CircularProgressIndicator(),
              new Text("Loading"),
            ],
          ),
        );
      },
    );
  }
}

/// Button Custom widget
class ButtonCustom extends StatelessWidget {
  @override
  String txt;
  GestureTapCallback ontap;
  Color gradient1;
  Color gradient2;
  Color border;

  ButtonCustom({this.txt, this.gradient1, this.gradient2, this.border});

  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.white,
        child: LayoutBuilder(builder: (context, constraint) {
          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 52.0,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: border,
                ),
                borderRadius: BorderRadius.circular(80.0),
                gradient: LinearGradient(colors: [
                  gradient1,
                  gradient2,
                ]),
              ),
              child: Center(
                  child: Text(
                txt,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w300,
                    fontFamily: "Sofia",
                    letterSpacing: 0.9),
              )),
            ),
          );
        }),
      ),
    );
  }
}

/// Set Animation Login if user click button login
class AnimationSplashLogin extends StatefulWidget {
  AnimationSplashLogin({Key key, this.animationController})
      : animation = new Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn)),
        super(key: key);

  final AnimationController animationController;
  final Animation animation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  @override
  _AnimationSplashLoginState createState() => _AnimationSplashLoginState();
}

/// Set Animation Login if user click button login
class _AnimationSplashLoginState extends State<AnimationSplashLogin> {
  @override
  Widget build(BuildContext context) {
    widget.animationController.addListener(() {
      if (widget.animation.isCompleted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => new signinPhoneTemplate1()));
        //hello
      }
    });
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: widget._buildAnimation,
    );
  }
}

/// Set Animation signup if user click button signup
class AnimationSplashSignup extends StatefulWidget {
  AnimationSplashSignup({Key key, this.animationController})
      : animation = new Tween(
          end: 900.0,
          begin: 70.0,
        ).animate(CurvedAnimation(
            parent: animationController, curve: Curves.fastOutSlowIn)),
        super(key: key);

  final AnimationController animationController;
  final Animation animation;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
      padding: EdgeInsets.only(bottom: 60.0),
      child: Container(
        height: animation.value,
        width: animation.value,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: animation.value < 600 ? BoxShape.circle : BoxShape.rectangle,
        ),
      ),
    );
  }

  @override
  _AnimationSplashSignupState createState() => _AnimationSplashSignupState();
}

/// Set Animation signup if user click button signup
class _AnimationSplashSignupState extends State<AnimationSplashSignup> {
  @override
  Widget build(BuildContext context) {
    widget.animationController.addListener(() {
      if (widget.animation.isCompleted) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => new signinPhoneTemplate1()));
      }
    });
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: widget._buildAnimation,
    );
  }
}
