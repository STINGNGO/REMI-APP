// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:remi/screen/loading.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
      },
    ));

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  signIn(String email, password) async {
    try {
      var jsonData = null;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      if (emailController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        var response =
            await http.post(Uri.parse('https://demoapi.remis.ng/Login'),
                headers: {
                  HttpHeaders.contentTypeHeader: 'application/json',
                },
                body: jsonEncode(
                  {
                    "email": email,
                    "password": password,
                  },
                ));
        if (response.statusCode == 200) {
          Center(
            child: SpinKitDualRing(
              color: Colors.blue,
            ),
          );
          jsonData = jsonDecode(response.body);
          setState(() {
            sharedPreferences.setString('token', jsonData['token']);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) => Loading()),
                (route) => false);
            // print(jsonData['token']);
          });
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Invalid Login')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Blank Field Not Allowed')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Check Network Connection')));
      return null;
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool hidePassword = true;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Image.asset(''),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.blue[900],
                    ),
                    hintText: "E-mail",
                    fillColor: Colors.blue[900],
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: hidePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue[900],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      color: Colors.blueAccent.withOpacity(0.4),
                      icon: Icon(hidePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                    ),
                    hintText: "Password",
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
                        _isLoading = true;
                        // Center(child: const CircularProgressIndicator());
                      });
                      SnackBar(
                        content: Text('Login in successfull'),
                      );

                      signIn(emailController.text, passwordController.text);
                    },
                    child: Text(
                      'Login',
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
      ],
    ));
  }
}
