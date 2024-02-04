import 'package:flutter/material.dart';
import 'package:vocality/config/themes.dart';

Widget bottomSheet({
  required double height,
  required Function() onTap,
  required String title
}) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            title,
            style: tsGeneral14(isHaighlight: true)
          ),
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Favorite'),
          onTap: onTap
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text('Gallery'),
          onTap: onTap
        ),
      ],
    ),
  );
}