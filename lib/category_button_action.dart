import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryAction {
  final Color color;
  final String label;
  final Color labelColor;
  final IconData iconData;
  final Color iconColor;
  final void Function(BuildContext) callback;

  CategoryAction({
    this.color = Colors.blueGrey,
    required this.label,
    this.labelColor = Colors.white,
    required this.iconData,
    this.iconColor = Colors.white,
    required this.callback,
  });
}

class CategoryButton extends StatelessWidget {
  final CategoryAction action;

  const CategoryButton({
    Key? key,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: const EdgeInsets.all(10),
      height: 200,
      child:OutlinedButton(
        onPressed: () => action.callback.call(context),
        style: OutlinedButton.styleFrom(
          backgroundColor: action.color,
          padding: const EdgeInsets.all(20.0),
        ),
        child: Container(
            child: Stack( children:
            <Widget> [Align(
                alignment: Alignment.center,
                child: Icon(action.iconData, color: action.iconColor, size: 100)),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(action.label,
                      style: TextStyle(color: action.labelColor)))],
            )
        )

      ) ,

    ));
  }
}