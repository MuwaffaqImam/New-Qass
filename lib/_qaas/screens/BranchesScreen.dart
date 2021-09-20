import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/Data_Model/categoryDetail.dart';
import 'package:food_template/_qaas/bloc/tenants/tenants_bloc.dart';
import 'package:food_template/_qaas/locale/LocaleManager.dart';
import 'package:food_template/_qaas/models/Branch.dart';
import 'package:food_template/_qaas/res/Fonts.dart';

class BranchesScreen extends StatelessWidget {
  final String title;

  BranchesScreen({this.title});

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
          List<Branch> branches =
              (state as TenantsBranchesSuccess).branchesList;
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
                  LocalManager.translate(word: 'الفروع'),
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
                      return cardList(branches[index]);
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

    var _imageSlider = Container(
      height: 292.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        dotColor: Colors.white.withOpacity(0.8),
        dotSize: 5.5,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Color(0xFF1E2026).withOpacity(0.1),
        overlayShadowSize: 0.9,
        images: [
          AssetImage("assets/Template1/banner/7.jpg"),
          AssetImage("assets/Template1/banner/4.jpg"),
          AssetImage("assets/Template1/banner/5.jpg"),
          AssetImage("assets/Template1/banner/6.jpg"),
        ],
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
            _imageSlider,
            recommended(),
          ],
        ),
      ),
    );
  }
}

class cardList extends StatelessWidget {
  @override
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

  Branch branch;

  cardList(this.branch);

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
      child: InkWell(
        onTap: () {},
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
                            branch.name,
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
                              Icons.location_on_rounded,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            Padding(padding: EdgeInsets.only(top: 2.0,left: 8)),
                            Text(branch.phone ?? 'عمان - الأردن',
                                style: _txtStyleSub)
                          ],
                        ),
                      ),
                      Padding(padding: const EdgeInsets.only(top: 4.9),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.phone_android_rounded,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            Padding(padding: EdgeInsets.only(top: 2.0,left: 8)),
                            Text(branch.phone ?? '0799999999',
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
                              Icons.email_rounded,
                              size: 16.0,
                              color: Colors.white,
                            ),
                            Padding(padding: EdgeInsets.only(top: 2.0,left: 8)),
                            Text(branch.email ?? 'm.zizo@edu.jo',
                                style: _txtStyleSub)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        LocalManager.translate(word: 'عددالأشخاص'),
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFFFF975D),
                            fontWeight: FontWeight.w500,
                            fontFamily: Fonts.elMessriFamily),
                      ),
                      Text(
                        '${branch.countersNumber}',
                        style: TextStyle(
                            fontSize: 60.0,
                            color: Color(0xFFFF975D),
                            fontWeight: FontWeight.w500,
                            fontFamily: Fonts.elMessriFamily),
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

Widget _card(String image, title, location, ratting, id, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Hero(
            tag: 'hero-tag-${id}',
            child: Material(
              color: Color(0xFF1E2026),
              child: Container(
                height: 220.0,
                width: 160.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                    color: Colors.white12,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          color: Colors.white12.withOpacity(0.1),
                          spreadRadius: 2.0)
                    ]),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          title,
          style: TextStyle(
              fontFamily: "Sofia",
              fontWeight: FontWeight.w600,
              fontSize: 17.0,
              color: Colors.white),
        ),
        SizedBox(
          height: 2.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.location_on,
              size: 18.0,
              color: Colors.white12,
            ),
            Text(
              location,
              style: TextStyle(
                  fontFamily: "Sofia",
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0,
                  color: Colors.white38),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.star,
              size: 18.0,
              color: Colors.yellow,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Text(
                ratting,
                style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Sofia",
                    fontSize: 13.0),
              ),
            ),
            SizedBox(
              width: 35.0,
            ),
            Container(
              height: 27.0,
              width: 82.0,
              decoration: BoxDecoration(
                  color: Color(0xFFFF975D),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Center(
                child: Text("Discount 15%",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.0)),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
