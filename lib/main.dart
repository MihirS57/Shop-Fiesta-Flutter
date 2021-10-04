import 'package:flutter/material.dart';
import 'package:shop_fiesta/BottomNav.dart';
import 'package:shop_fiesta/CartTab/cart_screen.dart';
import 'package:shop_fiesta/CategoryTab/category_screen.dart';
import 'package:shop_fiesta/CategoryTab/product_list.dart';
import 'package:shop_fiesta/LoginRegister/LoginScreen.dart';
import 'package:shop_fiesta/LoginRegister/RegisterScreen.dart';
import 'package:shop_fiesta/ProfileTab/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Fiesta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shop Fiesta',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      home: LoginScreen(),
      routes: {
        RegisterScreen.routename: (ctx) => RegisterScreen(),
        CategoryScreen.routeName: (ctx) => CategoryScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        ProductList.routeName: (ctx) => ProductList()
        // go to category meals screen
      },
      // used when route is not mentioned in this then you set a default route
      /* onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        },
        // if no routes mentioned here, this is called
        onUnknownRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
        }); */
    );
  }
}
