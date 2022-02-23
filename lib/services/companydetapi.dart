// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:remi/models/companydetail.dart';
// import 'dart:io';
// import 'package:shared_preferences/shared_preferences.dart';

// class CompanydetApi {
//   Future<dynamic> fetchDet() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String? token = sharedPreferences.getString('token');

//     final response = await http
//         .get(Uri.parse('https://demodev.remis.ng/Company/Details'), headers: {
//       HttpHeaders.contentTypeHeader: 'application/json',
//       HttpHeaders.authorizationHeader: 'Bearer $token',
//     });
//     if (response.statusCode == 200) {
//       var body = response.body;
//       // ignore: avoid_print
//       print(body);
//       return body;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
// }
