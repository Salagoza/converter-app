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
      child:OutlinedButton.icon(
        onPressed: () => action.callback.call(context),
        style: OutlinedButton.styleFrom(
          backgroundColor: action.color,
          padding: const EdgeInsets.all(16.0),
        ),
        label: Text(action.label, style: TextStyle(color: action.labelColor)),
        icon: Icon(action.iconData, color: action.iconColor),
      ) ,

    ));
  }
}