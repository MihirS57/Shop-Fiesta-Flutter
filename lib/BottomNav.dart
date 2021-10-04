import 'package:flutter/material.dart';
import 'package:shop_fiesta/CartTab/cart_screen.dart';
import 'package:shop_fiesta/CategoryTab/category_screen.dart';
import 'package:shop_fiesta/ProfileTab/profile_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedScreen = 0;
  var currentScreen;
  List<Map<String, dynamic>> routeList = [
    {"title": "Home Categories", "route": CategoryScreen()},
    {"title": "Cart", "route": CartScreen()},
    {"title": "Profile", "route": ProfileScreen()}
  ];
  setScreen(int index) {
    setState(() {
      selectedScreen = index;
      currentScreen = routeList[selectedScreen]["route"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    currentScreen = routeList[selectedScreen]["route"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.centerLeft,
            child: Text(routeList[selectedScreen]["title"])),
      ),
      drawer: Drawer(
        child: Container(
            //alignment: Alignment.center,
            child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: Theme.of(context).primaryColor,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Icon(
                          Icons.account_circle_outlined,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                      //SizedBox(width: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Hello, Mihir',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              //trailing: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.money),
              title: Text('Your Orders'),
              //trailing: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Wishlist'),
              //trailing: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.business_center),
              title: Text('Do Business with Shop Fiesta'),
              //trailing: Text('Home'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              //trailing: Text('Home'),
            ),
          ],
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedScreen,
        onTap: (index) => setScreen(index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shop_rounded), title: Text('Cart')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), title: Text('Profile')),
        ],
      ),
      body: currentScreen,
    );
  }
}
