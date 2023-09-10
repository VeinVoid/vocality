import 'package:flutter/material.dart';

Widget ElevetedButtonWidget
({
  required void Function() onPressed,
  required Widget child
}){
  return ElevatedButton(
    onPressed: onPressed, 
    child: child
  );
}