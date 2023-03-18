import 'package:flutter/material.dart';
import 'package:flutterproject/Accounts/Sign_Up.dart';
import "package:http/http.dart" as http;
import 'package:flutterproject/Dashboard2/dash2.dart';

import '../services/auth_service.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  static const String _title1 = 'Welcome to A2F';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title1,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title1)),
        body: const MyStatefulWidget(),
      ),


    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // TextEditingController nameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController regIDController = TextEditingController();
  TextEditingController choiceController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController bKashController = TextEditingController();
  final AuthService authService=AuthService();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'A2F',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: choiceController,

                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'University Registration ID /Email',
                ),
              ),
            ),

            // Container(
            //   padding: const EdgeInsets.all(10),
            //   child: TextField(
            //     controller: emailController,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Email',
            //     ),
            //   ),
            // ),


            // Container(
            //   padding: const EdgeInsets.all(10),
            //   child: TextField(
            //     controller: regIDController,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'University Registration ID',
            //     ),
            //   ),
            // ),


            // Container(
            //   padding: const EdgeInsets.all(10),
            //   child: TextField(
            //     controller: phoneController,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Phone Number',
            //     ),
            //   ),
            // ),


            // Container(
            //   padding: const EdgeInsets.all(10),
            //   child: TextField(
            //     controller: bKashController,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'bKash Number',
            //     ),
            //   ),
            // ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () {
                    String name=choiceController.text;
                    String pass=passwordController.text;
                    //MakeDashboardItems();
                    print(name);
                    // print(nameController.text);
                    print(passwordController.text);

                   // upload_in_js();
                    authService.signInUser(context: context, email: choiceController.text, password: passwordController.text);

                   // Navigator.push(context, MaterialPageRoute(builder:(context)=>MenuDashboardPage()),);

                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen


                    Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp()),);
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }

  void  upload_in_js() async{
    String name=choiceController.text;
    String pass=passwordController.text;

    // var response=
    await http.post(Uri.parse('http://10.0.2.2:8000/user/new'),body: {
      "name1":name,
      "pass1":pass,

    }).then((res) {
      print(res);
    }).catchError((err){
      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      print(err);
    });
  }


}

