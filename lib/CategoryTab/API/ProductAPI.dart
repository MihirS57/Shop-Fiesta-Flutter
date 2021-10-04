import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  Future<dynamic> getProductByType(String type) async {
    try {
      const Map<String, String> header = {
        'Content-type': 'application/json',
        'Accept': 'application/json'
      };
      var response = await http
          .get(Uri.parse('http://localhost:1306/api/v1/products/' + type));
      if (response.statusCode == 200) {
        print(response.body);
        print(response.statusCode);
        return response.body;
      } else {
        print(response.body);
        print(response.statusCode);
        return response.body;
      }
    } catch (err) {
      print(err.toString());
      throw err;
    }
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
