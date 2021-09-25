import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:food_template/_qaas/res/Colors.dart';
import 'package:food_template/_qaas/res/Fonts.dart';
import 'package:food_template/_qaas/res/dimens.dart';
import 'package:provider/provider.dart';

import '../HomePageT5.dart';
import 'CircularImage.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  final List<MenuItem> options = [
    MenuItem(Icons.search, 'Search'),
    MenuItem(Icons.shopping_basket, 'Performance'),
    MenuItem(Icons.favorite, 'Leaderboard'),
    MenuItem(Icons.code, 'Lessons'),
    MenuItem(Icons.format_list_bulleted, 'Podcast'),
    MenuItem(Icons.format_list_bulleted, 'Store'),
  ];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        body: Container(
          color: MyColors.eggplant,
          child: GestureDetector(
            onPanUpdate: (details) {
              //on swiping left
              if (details.delta.dx < -6) {
                Provider.of<MenuController>(context, listen: true).toggle();
              }
            },
            child: Container(
              padding: EdgeInsets.only(
                  top: 90,
                  left: 12,
                  bottom: 8,
                  right: 8),
              child:
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: CircularImage(
                            NetworkImage(imageUrl),
                          ),
                        ),
                        SizedBox(width: Dimens.space20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'احمد الأحمد',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontFamily: Fonts.elMessriFamily,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'm.ahmed@gmail.com',
                              style: TextStyle(
                                color: Colors.white54,
                                fontFamily: Fonts.elMessriFamily,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Dimens.space100),
                    child: Column(
                      children: <Widget>[
                        _listText("الإشعارات", EvaIcons.bell),
                        _listText("إتصل بنا", EvaIcons.phone),
                        _listText("الإعدادات", EvaIcons.settings),
                        _listText("المستخدم", EvaIcons.person),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: _listText("تسجيل الخروج", Icons.exit_to_app)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _listText(String _text, IconData _iconData) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.space4),
      child: Row(
        children: <Widget>[
          Container(
            height: 45.0,
            width: 45.0,
            decoration: BoxDecoration(),
            child: Center(
              child: Icon(
                _iconData,
                color: Colors.white70,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            _text,
            style: TextStyle(
                fontFamily: "Sofia",
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
                fontSize: 16.0),
          )
        ],
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
