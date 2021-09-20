import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/_qaas/screens/HomeScreen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '_qaas/bloc/tenants/tenants_bloc.dart';



void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return  MaterialApp(
      title: 'طابور',
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
      body: BlocProvider(
        create: (_) => TenantsBloc()..add(TenantList()),
        child: HomeScreenT1(),
      ),
    );
  }
}

