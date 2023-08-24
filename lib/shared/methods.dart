import 'package:flutter/material.dart';

Future<dynamic> navigateToWithoutBack(context,Widget widget)=>Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder:(context)=> widget,
    ),
        (route) => false
);
Future<dynamic> navigateTo(context,Widget widget)=>Navigator.push(
  context,
  MaterialPageRoute(builder:(context)=>widget ),
);