import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/Data_Model/categoryDetail.dart';
import 'package:food_template/_qaas/bloc/tenants/tenants_bloc.dart';
import 'package:food_template/_qaas/locale/LocaleManager.dart';
import 'package:food_template/_qaas/models/Branch.dart';
import 'package:food_template/_qaas/models/Service.dart';
import 'package:food_template/_qaas/res/Fonts.dart';
import 'package:food_template/_qaas/screens/tickets/TicketsScreen.dart';

class ServiceScreen extends StatelessWidget {
  final String title;

  ServiceScreen({this.title});

  Widget recommended() {
    return BlocBuilder<TenantsBloc, TenantsState>(
      builder: (context, state) {
        if (state is Loading)
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: const CircularProgressIndicator(
              color: Colors.amber,
            )),
          );
        else if (state is Failure) {
          return const Center(child: Text('Error'));
        } else {
          List<ServiceProvided> branches =
              (state as ServicesSuccess).servicesList;
          if (branches.isEmpty)
            return Center(
              child: Text(
                LocalManager.translate(word: 'لا يوجد خدمات'),
                style: TextStyle(
                    color: Colors.redAccent,
                    fontFamily: Fonts.elMessriFamily,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700),
              ),
            );

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: Text(
                  LocalManager.translate(word: 'الخدمات'),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: Fonts.elMessriFamily,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (ctx, index) {
                      return ServiceCard(branches[index]);
                    },
                    itemCount: branches.length,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var _appBar = PreferredSize(
      preferredSize: Size.fromHeight(45.0),
      child: AppBar(
        backgroundColor: Color(0xFF1E2026),
        brightness: Brightness.dark,
        title: Text(
          title,
          style: TextStyle(color: Colors.white, fontFamily: "Sofia"),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );

    return Scaffold(
      appBar: _appBar,
      backgroundColor: Color(0xFF1E2026),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            recommended(),
          ],
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  var _txtStyleTitle = TextStyle(
    color: Colors.white,
    fontFamily: Fonts.elMessriFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w800,
  );

  var _txtStyleSub = TextStyle(
    color: Colors.white,
    fontFamily: Fonts.tajwalFamily,
    fontSize: 12.5,
    fontWeight: FontWeight.w600,
  );

  ServiceProvided service;

  ServiceCard(this.service);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new BlocProvider(
                create: (_) => TenantsBloc()..add(SendTickets(locationId: service.locationId,serviceId: service.serviceId)),
                child: new TicketsScreen(),
              ),
              transitionDuration: Duration(milliseconds: 600),
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return Opacity(
                  opacity: animation.value,
                  child: child,
                );
              }));
        },
        child: Container(
          height: 140.0,
          decoration: BoxDecoration(
              color: Color(0xFF23252E),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    color: Colors.white12.withOpacity(0.1),
                    blurRadius: 3.0,
                    spreadRadius: 1.0)
              ]),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 220.0,
                          child: Text(
                            '${service.service.name}',
                            style: _txtStyleTitle,
                            overflow: TextOverflow.ellipsis,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.9),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.access_time_rounded,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 2.0, left: 8)),
                            Text('${service.startTime}',
                                style: _txtStyleSub)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.9),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.av_timer_rounded,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 2.0, left: 8)),
                            Text(
                                '${service.endTime}',
                                style: _txtStyleSub)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.9),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.description_rounded,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 2.0, left: 8)),
                            Text(
                                '${service.service.description}',
                                style: _txtStyleSub)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocalManager.translate(word: 'إحجز تذكرة'),
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFFF975D),
                            fontWeight: FontWeight.w500,
                            fontFamily: Fonts.elMessriFamily),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          size: 30,
                          color: Color(0xFFFF975D),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
