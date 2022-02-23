import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DasboardApi {
  double? balance;
  int? vouchers; //vouchers of the company
  int? vehicles; //vehicles the company own
  int? drivers; //number of drivers
  int? total; //summary
  int? consumed; //summary
  int? expired; //summary
  int? consumption;

  DasboardApi(
      {this.balance,
      this.vouchers,
      this.vehicles,
      this.drivers,
      this.total,
      this.consumed,
      this.expired,
      this.consumption});

  Future<void> dash(DasboardApi dasboardApi) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    try {
      final response = await http.get(
          Uri.parse('https://demoapi.remis.ng/Company/Dashboard?range=0'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader: 'Bearer $token',
          });
      dynamic data1 = await jsonDecode(response.body);

      if (response.statusCode == 200) {
        // print('Token $token');
      } else {
        throw Exception('Failed to load data');
      }
      this.balance = data1['data']['dashboard']['balance'];
      this.consumed =
          data1['data']['dashboard']['todaySummary']['consumed'] ?? '';
      this.drivers = data1['data']['dashboard']['drivers'];
      this.expired =
          data1['data']['dashboard']['todaySummary']['expired'] ?? '';
      this.total = data1['data']['dashboard']['todaySummary']['total'] ?? '';
      this.vehicles = data1['data']['dashboard']['vehicles'] ?? '';
      this.vouchers = data1['data']['dashboard']['vouchers'] ?? '';
      this.consumption = data1['data']['dashboard']['totalConsumption'] ?? '';
    } catch (e) {
      print(e);
    }

    // print(balance);
    // print('dara');
    // print(data1.toString());
  }
}
