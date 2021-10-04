import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_fiesta/CategoryTab/API/ProductAPI.dart';
import 'package:shop_fiesta/CategoryTab/product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);
  static String routeName = '\product-list';

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int count = 0;
  var res = '';
  List<dynamic> products = [];
  Map types = {
    "Mobiles": "mobile",
    "Electronics": "electronics",
    "Home Appliances": "home-appliances",
    "Grocery": "grocery",
    "Fashion": "fashion",
    "Home": "home"
  };

  getProducts(String type) async {
    var res = jsonDecode(await ProductAPI().getProductByType(type));
    //print(res);
    List<dynamic> prod = res["products"];
    int cnt = res["count"];
    if (cnt == 0) {
      prod = [
        {
          "name": "No Information Available",
          "cost": 0,
          "description": "No Information Available",
          "available": false,
          "warranty": "No Information Available",
          "countryOfOrigin": "No Information Available"
        }
      ];
      cnt = cnt + 1;
    }
    setState(() {
      products = prod;
      count = cnt;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getProducts("mobile");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map args =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    //getProducts(types[args["title"]]);
    return Scaffold(
      appBar: AppBar(
        title: Text(args["title"]),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: count,
            itemBuilder: (BuildContext context, index) {
              return ProductItem(
                  product_imageUrl: products[index]["imageUrl"],
                  product_cost: products[index]["cost"],
                  product_name: products[index]["name"],
                  product_origin: products[index]["countryOfOrigin"],
                  product_stock: products[index]["available"]);
            }),
      ),
    );
  }
}
