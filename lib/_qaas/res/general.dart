import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_template/_qaas/screens/common/dialog/error_dialog.dart';

class General {


  static dynamic callErrorDialog(BuildContext context, String text) {
    showDialog<dynamic>(
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(
            message: text,
          );
        });
  }
}