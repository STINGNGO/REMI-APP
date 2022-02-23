// ignore_for_file: avoid_init_to_null, unused_local_variable, prefer_const_constructors, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:remi/screen/detail.dart';
import 'package:remi/screen/driver.dart';
import 'package:remi/screen/voucher.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/dash': (context) => const Dashboard(),
      },
    ));

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  dynamic data1 = {};

  @override
  Widget build(BuildContext context) {
    data1 =
        data1.isNotEmpty ? data1 : ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white24,
        elevation: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.home_outlined), onPressed: () {}),
              Spacer(),
              IconButton(
                icon: Icon(Icons.confirmation_num_outlined),
                onPressed: () {},
              ),
              Spacer(),
              IconButton(
                  icon: Icon(Icons.favorite_outline_sharp), onPressed: () {}),
              Spacer(),
              IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Detail()));
                  }),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: 'Hello  ',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]),

                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                TextSpan(
                                  text: 'Danny,',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ]),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_active_outlined,
                              size: 30,
                              color: Colors.blue[900],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 8,
                            color: Colors.blue[900],
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // ignore: prefer_const_constructors
                                    Text(
                                      'Balance',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.amber,
                                      ),
                                    ),
                                    Spacer(),
                                    // ignore: prefer_const_constructors
                                    Text(
                                      data1['balance'].toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              width: 400.0,
                              height: 125.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            color: Colors.white,
                            elevation: 8,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Voucher()));
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.credit_card,
                                        size: 32,
                                        color: Colors.blue[900],
                                      ),
                                      Text(
                                        'Voucher',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontSize: 12.9,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                width: 80.0,
                                height: 80.0,
                              ),
                            ),
                          ),
                          Spacer(),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            color: Colors.white,
                            elevation: 8,
                            child: InkWell(
                              onTap: () {
                                // ignore: avoid_print
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.directions_car_outlined,
                                        size: 32,
                                        color: Colors.blue[900],
                                      ),
                                      Text(
                                        'Vehicle',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                width: 80.0,
                                height: 80.0,
                              ),
                            ),
                          ),
                          Spacer(),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            color: Colors.white,
                            elevation: 8,
                            // ignore: unnecessary_new
                            child: new InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Driver()));
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: 32,
                                        color: Colors.blue[900],
                                      ),
                                      Text(
                                        'Driver',
                                        style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                width: 80.0,
                                height: 80.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            elevation: 8,
                            color: Colors.white,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      'Voucher  :',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      data1['vouchers'].toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              width: 320.0,
                              height: 65.0,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            elevation: 8,
                            color: Colors.white,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      'Driver  :',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      data1['drivers'].toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              width: 320.0,
                              height: 65.0,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.0),
                            ),
                            elevation: 8,
                            color: Colors.white,
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text(
                                      'Vehicles  :',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      data1['vehicles'].toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blue[900],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              width: 320.0,
                              height: 65.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
