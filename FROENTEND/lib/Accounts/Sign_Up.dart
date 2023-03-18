import 'package:flutter/material.dart';
import 'package:flutterproject/Accounts/Login.dart';
import "package:http/http.dart" as http;
import 'package:flutterproject/services/auth_service.dart';

String uri= 'http://10.0.2.2:8000';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController regIDController = TextEditingController();
  TextEditingController choiceController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bKashController = TextEditingController();
  TextEditingController yearController=TextEditingController();
  final AuthService authService=AuthService();


  // void signUser()
  // {
  //   String username=nameController.text;
  //   String email=emailController.text;
  //   String password=passwordController.text;
  //   String pass2=passwordController2.text;
  //   String UniversityRegistrationID=regIDController.text;
  //   String PhoneNumber=phoneController.text;
  //   String bKashNumber=bKashController.text;
  //   String currentBsseYear=yearController.text;
  //
  //   authService.signUpUser(context: context,
  //       username: username,
  //       email: email,
  //       UniversityRegistrationID: UniversityRegistrationID,
  //       password: password,
  //       // password2: password2,
  //       PhoneNumber: PhoneNumber, bKashNumber: bKashNumber,
  //       currentBsseYear: currentBsseYear);
  // }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: ListView(


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
                  'Sign Up',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,

                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),


            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: regIDController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'University Registration ID',
                ),
              ),
            ),


            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
            ),


            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: bKashController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'bKash Number',
                ),
              ),
            ),

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
              child: const Text('Confirm Password',),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: yearController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Current BSSE Year',
                ),
              ),
            ),


            Container(
                height: 70,
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    String name=nameController.text;
                    String pass=passwordController.text;
                    //MakeDashboardItems();
                    print(name);
                    // print(nameController.text);
                    print(passwordController.text);
   //aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
                   // upload_in_js();


                    authService.signUpUser(context: context, username: nameController.text, email: emailController.text, UniversityRegistrationID: regIDController.text, password: passwordController.text, PhoneNumber: phoneController.text, bKashNumber: bKashController.text, currentBsseYear: yearController.text);
                   // Navigator.push(context, MaterialPageRoute(builder:(context)=>Login()),);
                  },
                )
            ),

          ],

        ));
  }




  void  upload_in_js() async{
    String username=nameController.text;
    String email=emailController.text;
    String password=passwordController.text;
    String pass2=passwordController2.text;
    String UniversityRegistrationID=regIDController.text;
    String PhoneNumber=phoneController.text;
    String bKashNumber=bKashController.text;
    String currentBsseYear=yearController.text;
print("codeeee");
    // var response=
    http.Response res=
    await http.post( Uri.parse('$uri/user/new'),body: {
      "username":username,
      "email":email,
      "UniversityRegistrationID":UniversityRegistrationID,
      "password":password,
      "PhoneNumber":PhoneNumber,
      "bKashNumber":bKashNumber,
      "currentBsseYear":currentBsseYear,




    });
    print(res.body);
  }

}

