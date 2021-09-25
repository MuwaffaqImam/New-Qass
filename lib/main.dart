import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/_qaas/screens/HomeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Screen/Template5/HomePage/Drawer/DrawerScreen.dart';
import '_qaas/bloc/tenants/tenants_bloc.dart';
import '_qaas/locale/LocaleManager.dart';
import '_qaas/res/Fonts.dart';



void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
//      title: 'طابور',
     debugShowCheckedModeBanner: false,
     localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', ''), // English, no country code
      ],
      home: MyStartingHomePage(),
    );
  }

}

class MyStartingHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuScreen(),
      appBar: AppBar( backgroundColor: Color(0xFF23252E),
        title: Text(
        LocalManager.translate(word: "طابور"),
        style: TextStyle(
            fontFamily: Fonts.elMessriFamily,
            fontWeight: FontWeight.w800,
            fontSize: 22.0,
            letterSpacing: 1.5,
            color: Colors.white),
      ),),
      body: BlocProvider(
        create: (_) => TenantsBloc()..add(TenantList()),
        child: HomeScreen(),
      ),
    );
  }
}

