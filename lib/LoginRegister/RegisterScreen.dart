import 'package:flutter/material.dart';
import 'package:shop_fiesta/LoginRegister/API/UserAPI.dart';
import 'package:shop_fiesta/BottomNav.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String routename = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: Text('Register'),
      ), */
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Shop Fiesta',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Card(
              elevation: 15,
              shadowColor: Colors.grey,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                        controller: name,
                        decoration: InputDecoration(hintText: 'Name')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                        controller: password,
                        decoration: InputDecoration(hintText: 'Password')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                        controller: username,
                        decoration: InputDecoration(hintText: 'Username')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                        controller: password,
                        decoration: InputDecoration(hintText: 'Password')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                        controller: address,
                        decoration: InputDecoration(hintText: 'Address')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextField(
                        controller: dateofbirth,
                        decoration: InputDecoration(hintText: 'Date Of Birth')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                            onPressed: () async {
                              await UserAPI().registerUser(
                                  name.text,
                                  username.text,
                                  password.text,
                                  address.text,
                                  dateofbirth.text,
                                  context);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const BottomNavigation(),
                                ),
                              );
                            },
                            child: Text('Register')),
                      ],
                    )
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
