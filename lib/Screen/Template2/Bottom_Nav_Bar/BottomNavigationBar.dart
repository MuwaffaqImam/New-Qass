import 'package:flutter/material.dart';
import 'package:food_template/Screen/Template2/B1_Home_Screen/B1_Home_Screen_T2.dart';
import 'package:food_template/Screen/Template2/B2_Favorite_Screen/B2_Favorite_Screen.dart';
import 'package:food_template/Screen/Template2/B3_Category_Screen/B3_Category_Screen.dart';
import 'package:food_template/Screen/Template2/B4_MyOrder_Screen/B4_MyOrder_Screen.dart';
import 'package:food_template/Screen/Template2/B5_Profile_Screen/B5_Profile_Screen.dart';

class bottomNavigationBarT2 extends StatefulWidget {
  @override
  _bottomNavigationBarT2State createState() => _bottomNavigationBarT2State();
}

class _bottomNavigationBarT2State extends State<bottomNavigationBarT2> {
  int currentIndex = 0;

  /// Set a type current number a layout class
  Widget callPage(int current) {
    switch (current) {
      case 0:
        return new HomeScreenT2();
      case 1:
        return new FavoriteScreenT2();
      case 2:
        return new CategoryScreenT2();
      case 3:
        return new MyOrderScreenT2();
        break;
      case 4:
        return new ProfileScreenT2();
        break;
      default:
        return HomeScreenT2();
    }
  }

  /// Build BottomNavigationBar Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: callPage(currentIndex),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(color: Colors.black26.withOpacity(0.15)))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            fixedColor: Color(0xFFF48522),
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_grocery_store,
                    size: 20.0,
                  ),
                  title: Text(
                    "Home",
                    style: TextStyle(fontFamily: "Sofia", letterSpacing: 0.5),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_grocery_store,
                  ),
                  title: Text(
                    "Favorite",
                    style: TextStyle(fontFamily: "Sofia", letterSpacing: 0.5),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.grain),
                  title: Text(
                    "Category",
                    style: TextStyle(fontFamily: "Sofia", letterSpacing: 0.5),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_grocery_store,
                    size: 24.0,
                  ),
                  title: Text(
                    "My Order",
                    style: TextStyle(fontFamily: "Sofia", letterSpacing: 0.5),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.local_grocery_store,
                    size: 22.0,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(fontFamily: "Sofia", letterSpacing: 0.5),
                  )),
            ],
          )),
    );
  }
}
