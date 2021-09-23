import 'dart:collection';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/Data_Model/dinner.dart';
import 'package:food_template/Data_Model/lunch.dart';
import 'package:food_template/Screen/Template5/HomePage/Drawer/DrawerScreen.dart';
import 'package:food_template/Screen/Template5/HomePage/HomePageT5.dart';
import 'package:food_template/_qaas/bloc/login/login_bloc.dart';
import 'package:food_template/_qaas/bloc/login/login_state.dart';
import 'package:food_template/_qaas/res/dimens.dart';
import 'package:food_template/_qaas/screens/BranchesScreen.dart';
import 'package:food_template/_qaas/locale/LocaleManager.dart';
import 'package:food_template/_qaas/res/Colors.dart';
import 'package:food_template/_qaas/res/Fonts.dart';
import 'package:food_template/_qaas/screens/qr_scanner.dart';

import '../bloc/tenants/tenants_bloc.dart';
import '../models/Tenants.dart';
import 'Choose_Login.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  List<String> _image = [
    "assets/Template1/banner/1.jpg",
    "assets/Template1/banner/2.jpg",
    "assets/Template1/banner/3.jpg",
    "assets/Template1/banner/4.jpg",
    "assets/Template1/banner/5.jpg",
    "assets/Template1/banner/6.jpg",
    "assets/Template1/banner/7.jpg",
  ];

  var _background = Stack(
    children: <Widget>[
      Image(
        image: AssetImage('assets/Template1/image/profileBackground.png'),
        height: 350.0,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Container(
        height: 355.0,
        margin: EdgeInsets.only(top: 0.0, bottom: 105.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.0, 1.0),
            // stops: [0.0, 1.0],
            colors: <Color>[
              Color(0xFF1E2026).withOpacity(0.1),
              Color(0xFF1E2026).withOpacity(0.3),
              Color(0xFF1E2026),
              //  Color(0xFF1E2026),
            ],
          ),
        ),
      ),
    ],
  );



  Widget buildCategoriesView(String cat, List<Tenant> tenants) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: Dimens.space20, right: Dimens.space20, top:Dimens.space10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  // tenants.first?.category?.name,
                  cat??"لا يوجد اسم",
                  style: TextStyle(
                  fontFamily: Fonts.tajwalFamily,
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
                 // Text(
                 //   "مشاهدة المزيد",
                 //   style: TextStyle(
                 //       fontFamily: Fonts.tajwalFamily,
                 //       color: Colors.white54,
                 //       fontSize: 12.0,
                 //       fontWeight: FontWeight.w300),
                 // ),
              ]),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: Dimens.space10,
            ),
            child: Container(
              height: Dimens.space160,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return TenantCard(
                      colorTop: Color(0xFF1E2026),
                      colorBottom: Color(0xFF23252E),
                      image: tenants[index].logo,
                      title: tenants[index].name,
                      tenantId: tenants[index].id,
                    );
                  },
                  padding: EdgeInsets.only(left: 20),
                  itemCount: tenants.length),
            )),
      ],
    );
  }

  Widget build(BuildContext context) {
    var _search = Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(PageRouteBuilder(
            //     pageBuilder: (_, __, ___) => new searchAppbar()));
          },
          child: Container(
            height: 45.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 5.0,
                      spreadRadius: 0.0)
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Color(0xFFFF975D),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    LocalManager.translate(word: "إبحث"),
                    style: TextStyle(
                        fontFamily: Fonts.tajwalFamily,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                        fontSize: 16.0),
                  )
                ],
              ),
            ),
          ),
        ));

    var _sliderImage = Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          aspectRatio: 24 / 18,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: _image.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  //   Navigator.of(context).push(PageRouteBuilder(
                  //        pageBuilder: (_, __, ___) => new BannerScreen1(
                  //              image: i,
                  //            )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(i), fit: BoxFit.cover),
                      color: Color(0xFF23252E)),
                ),
              );
            },
          );
        }).toList(),
      ),
    );

    var _body = Padding(
      padding: const EdgeInsets.only(top: Dimens.space10),
      child: Column(
        children: <Widget>[
          // _search,
          _sliderImage,
          blocCategory(),
        ],
      ),
    );

    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF975D),
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => ScanQr(),
              transitionDuration: Duration(milliseconds: 600),
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return Opacity(
                  opacity: animation.value,
                  child: child,
                );
              }));
        },
        child: const Icon(Icons.qr_code_2_rounded, color: Color(0xFF23252E)),
      ),
      bottomNavigationBar: buildBottomBar(),
      backgroundColor: Color(0xFF23252E),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            _body,
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white12,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Container(
          margin: EdgeInsets.only(right: Dimens.space20,left: Dimens.space4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
//              InkWell(
//                onTap: () {
//
//                  Navigator.of(context).push(PageRouteBuilder(
//                      pageBuilder: (_, __, ___) => new MyHomePageT5()));
//
//                },
//                child: Container(
//                  padding: EdgeInsets.symmetric(horizontal: 8),
//                  margin: EdgeInsets.only(left: Dimens.space2,right: Dimens.space2),
//                  height: 60,
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: [
//                      Icon(Icons.menu_rounded),
//                      Text(
//                        LocalManager.translate(word: 'القائمة'),
//                        style: TextStyle(color: Colors.white, fontSize: 12),
//                      )
//                    ],
//                  ),
//                ),
//              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(left: Dimens.space4,right: Dimens.space4),
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        LocalManager.translate(word: 'المواقع'),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(left: Dimens.space4,right: Dimens.space4),

                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.description),
                      Text(
                        LocalManager.translate(word: 'تذاكر'),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (_, __, ___) =>

                      new BlocProvider(
                            create: (context) => LoginBloc(InitialState()),
                            child: chooseLogin(),
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
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.only(left: Dimens.space20,right: Dimens.space4),

                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.person),
                      Text(
                        LocalManager.translate(word: 'الملف الشخصي'),
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget blocCategory() {
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
          return const Center(child: Text('no posts'));
        } else {
          HashMap<String, List<Tenant>> map =
              (state as TenantsSuccess).getTenentsGrouped();
          return Container(
            margin: EdgeInsets.only(top: Dimens.space16),
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: map.length,
              itemBuilder: (BuildContext context, int index) {
                String key = map.keys.elementAt(index);
                return buildCategoriesView(key, map[key]);
              },
            ),
          );
        }
      },
    );
  }
}

class TenantCard extends StatelessWidget {
  Color colorTop, colorBottom;
  String image, title, tenantId;

  TenantCard(
      {this.colorTop, this.colorBottom, this.title, this.image, this.tenantId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimens.space92,
      height: Dimens.space160,
//      color: Colors.green,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 4.0, top: 3.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (_, __, ___) => new BlocProvider(
                      create: (_) => TenantsBloc()..add(TenantBranches(tenantId)),
                      child: new BranchesScreen(
                        title: title,
                      ),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: Dimens.space92,
                width: Dimens.space92,

                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 8.0, color: Colors.black54)],
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  gradient: LinearGradient(
                      colors: [colorTop, colorBottom],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: Align(
                      alignment: Alignment.center,
                    child: image == null || image.isEmpty?
                       Image.asset(
                        'assets/icon/bank.png',
                        height: Dimens.space96,
                        fit: BoxFit.cover,
                      ): Image.memory(base64Decode(image),height: Dimens.space96 ,fit: BoxFit.fill,)
                ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),

                   child: Text(
//                     'جامعة عمان الاهلية الجميلة',
                     title,
                     maxLines: 3,

                       textAlign: TextAlign.center,
                       style: TextStyle(
                      color: Colors.white70,

                      fontFamily: Fonts.tajwalFamily,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),



                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
