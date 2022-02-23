// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Addvoucher extends StatefulWidget {
  const Addvoucher({Key? key}) : super(key: key);

  @override
  _AddvoucherState createState() => _AddvoucherState();
}

class _AddvoucherState extends State<Addvoucher> {
  addVoucher(String amount, locationId, validity) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    var jsonData = null;
    if (amountController.text.isNotEmpty &&
        validityController.text.isNotEmpty &&
        locationIdController.text.isNotEmpty) {
      var response = await http.post(
        Uri.parse('https://demoapi.remis.ng/D/GenerateVoucher'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: jsonEncode(
          {
            "amount": amount,
            "validity": validity,
            "locationId": locationId,
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
  }

  TextEditingController amountController = TextEditingController();
  TextEditingController validityController = TextEditingController();
  TextEditingController locationIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Create Voucher')),
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
                      controller: amountController,
                      decoration: InputDecoration(
                        hintText: "Amount",
                        fillColor: Colors.blue[900],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: validityController,
                      decoration: InputDecoration(
                        hintText: "Validity",
                        fillColor: Colors.blue[900],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: locationIdController,
                      decoration: InputDecoration(
                        hintText: "LocationId",
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
                            addVoucher(
                                amountController.text,
                                validityController.text,
                                locationIdController.text);
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
}
