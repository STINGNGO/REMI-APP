// ignore_for_file: prefer_const_constructors, unused_local_variable, avoid_init_to_null

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:remi/models/companydetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddDriver extends StatefulWidget {
  const AddDriver({Key? key}) : super(key: key);

  @override
  _AddDriverState createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  late Company company;

  addDriver(
    String name,
    String phone,
    String email,
    String address,
    String city,
    String state,
  ) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('token');
      var jsonData = null;

      if (nameController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          addressController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          cityController.text.isNotEmpty &&
          stateController.text.isNotEmpty) {
        final queryParameters = {'companyId': company.id};
        var response = await http.post(
          Uri.parse('https://demoapi.remis.ng/Driver/Add/$queryParameters'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          },
          body: jsonEncode(
            {
              "name": name,
              "phone": phone,
              "email": email,
              "address": address,
              "city": city,
              "state": state,
            },
          ),
        );
        if (response.statusCode == 200) {
          jsonData = jsonDecode(response.body);
          setState(() {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Succefully Added')));
          });
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Please try again')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Fill in empty field')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Check Network Connection')));
      return null;
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Add Driver')),
        backgroundColor: Colors.blue[900],
      ),
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //Image.asset(''),
                    SizedBox(
                      height: 100,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Name",
                        fillColor: Colors.blue[900],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: "Phone number",
                        fillColor: Colors.blue[900],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        fillColor: Colors.blue[900],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: "Address",
                        fillColor: Colors.blue[900],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                        hintText: "City",
                        fillColor: Colors.blue[900],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: stateController,
                      decoration: InputDecoration(
                        hintText: "State",
                        fillColor: Colors.blue[900],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[800],
                            elevation: 10,
                            shadowColor: Colors.blue[700],
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)))),
                        onPressed: () {
                          setState(() {
                            addDriver(
                              nameController.text,
                              phoneController.text,
                              emailController.text,
                              addressController.text,
                              cityController.text,
                              stateController.text,
                            );
                          });
                        },
                        child: Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future fetchDet() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String? token = sharedPreferences.getString('token');

      final response = await http
          .get(Uri.parse('https://demodev.remis.ng/Company/Details'), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token',
      });
      if (response.statusCode == 200) {
        var y = json.decode(response.body);
        // print(y.toString());

        var companyId = Company.fromJson(y['data']['company']['id']);
        companyId = y;

        // ignore: avoid_print
        // print(r.toString());
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      //print(e);
    }
  }
}
