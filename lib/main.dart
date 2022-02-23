// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:remi/screen/dashboard.dart';
import 'package:remi/services/loginpage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        '/home': (context) => const LoginPage(),
        '/dash': (context) => const Dashboard(),
      },
    ));
