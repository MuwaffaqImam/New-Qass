import 'package:flutter/material.dart';
import 'package:food_template/_qaas/res/dimens.dart';
import 'package:food_template/Screen/Template4/Style/ThemeT4.dart' as Style;



class ErrorDialog extends StatefulWidget {
  const ErrorDialog({this.message});
  final String message;
  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return _NewDialog(widget: widget);
  }
}

class _NewDialog extends StatelessWidget {
  const _NewDialog({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final ErrorDialog widget;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
                height: 60,
                width: double.infinity,
                padding: const EdgeInsets.all(Dimens.space8),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: Style.Colors.mainColor),
                child: Row(
                  children: <Widget>[
                    const SizedBox(
                      width: Dimens.space4,
                    ),
                    Icon(
                      Icons.close,
                      color: Style.Colors.elementBack,
                    ),
                    const SizedBox(
                      width: Dimens.space4,
                    ),
                    Text('ERROR',
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(color: Style.Colors.elementBack)),
                  ],
                )),
            const SizedBox(
              height: Dimens.space20,
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: Dimens.space16,
                  right: Dimens.space16,
                  top: Dimens.space8,
                  bottom: Dimens.space8),
              child: Text(
                widget.message,
                style: Theme.of(context).textTheme.button,
              ),
            ),
            const SizedBox(
              height: Dimens.space20,
            ),
            Divider(
              thickness: 0.5,
              height: 1,
              color: Theme.of(context).iconTheme.color,
            ),
            MaterialButton(
              height: 50,
              minWidth: double.infinity,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Style.Colors.mainColor),
              ),
            )
          ],
        ));
  }
}
