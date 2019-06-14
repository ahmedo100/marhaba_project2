import 'package:flutter/material.dart';
import 'package:marhaba_project/mainpage.dart';
import 'package:marhaba_project/login.dart';
import 'package:marhaba_project/productpage.dart';

import 'CartPage.dart';
import 'notificationpage.dart';
void main() => runApp(MaterialApp(
  initialRoute: '/cartPage',
  routes: {
    '/': (context) =>Login(),
    '/mainPage' :(context)=> SearchPage(),
    '/notificationPage': (context)=>NotificationPage(),
    '/productDescription': (context)=> ProductPage(),
    '/cartPage': (context)=> CartPage(),
  },
debugShowCheckedModeBanner: false,

));


