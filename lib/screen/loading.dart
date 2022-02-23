// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:remi/services/dashboardapi.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupDash() async {
    DasboardApi instance = DasboardApi();

    await instance.dash(DasboardApi());
    // print('dara');
    // print(instance.vehicles);

    Navigator.pushReplacementNamed(context, '/dash', arguments: {
      'balance': instance.balance,
      'consumed': instance.consumed,
      'drivers': instance.drivers,
      'expired': instance.expired,
      'total': instance.total,
      'vehicles': instance.vehicles,
      'vouchers': instance.vouchers,
      'consumption': instance.consumption,
    });
  }

  @override
  void initState() {
    super.initState();
    setupDash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.blue[900],
          size: 90.0,
        ),
      ),
    );
  }
}
