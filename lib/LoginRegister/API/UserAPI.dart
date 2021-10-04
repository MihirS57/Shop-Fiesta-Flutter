import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_fiesta/BottomNav.dart';

class UserAPI {
  Future<bool> loginUser(
      String username, String password, BuildContext context) async {
    Map<String, dynamic> jsonData;
    var token;
    try {
      const Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      http
          .post(
        Uri.parse('http://localhost:1306/api/v1/auth/login'),
        headers: header,
        body: jsonEncode({'email': username, 'password': password}),
      )
          .then((value) {
        if (value.statusCode == 200) {
          var res = jsonDecode(value.body);
          var name = res["message"].split(' ')[0];
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Welcome $name'),
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const BottomNavigation(),
            ),
          );
          //return true;
          /* jsonData = new Map<String, dynamic>.from(json.decode(value.body));
          token = jsonData['token'];
          UserAPIs().setToken('token', token);
          print(token);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          ); */
        } else {
          print(value.statusCode);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Wrong Email/Password.'),
            ),
          );
          return false;
        }
      });
    } catch (e) {
      print(e.toString());
      throw e;
    }
    return false;
  }

  Future<void> registerUser(String name, String username, String password,
      String address, String dob, BuildContext context) async {
    Map<String, dynamic> jsonData;
    var token;
    try {
      const Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
      http
          .post(
        Uri.parse('http://localhost:1306/api/v1/auth/register'),
        headers: header,
        body: jsonEncode({
          'name': name,
          'email': username,
          'password': password,
          'dateofbirth': dob,
          'address': address
        }),
      )
          .then((value) {
        if (value.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Hello'),
            ),
          );
          /* jsonData = new Map<String, dynamic>.from(json.decode(value.body));
          token = jsonData['token'];
          UserAPIs().setToken('token', token);
          print(token);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen(),
            ),
          ); */
        } else {
          print(value.statusCode);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Something went wrong'),
            ),
          );
        }
      });
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
