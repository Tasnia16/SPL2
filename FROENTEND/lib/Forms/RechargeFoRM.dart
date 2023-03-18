
import 'package:flutter/material.dart';
import 'package:flutterproject/Accounts/HomePage.dart';
import 'package:flutterproject/DASH/dashboard.dart';
import 'package:flutterproject/Dashboard2/dash2.dart';
import 'package:flutterproject/Accounts/Sign_Up.dart';

class Recharge extends StatefulWidget {
  const Recharge({Key? key}) : super(key: key);

  @override
  State<Recharge>createState() => _myRecharge();
}

class _myRecharge extends State<Recharge> {

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('A2F'),
      ),


      body: Padding(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          padding: EdgeInsets.all(25),
    child: Column(
    children:<Widget>[

            Container(
                // height: 1000,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage('assets/form.jpg'),
                //
                //       fit: BoxFit.cover,
                //
                //     )
                // ),

                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Stack(
                  children:<Widget> [



                    Text(

                      'Recharge Your Wallet',
                      style: TextStyle(
                        fontSize: 35,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.blue[700]!,
                      ),

                      textAlign: TextAlign.center,
                    ),
                    // Solid text as fill.
                    Text(
                      'Recharge Your Wallet',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.grey[300],

                      ),
                      textAlign: TextAlign.center,
                    ),


                    Padding(
                      //padding: EdgeInsets.all(39),
                      padding: EdgeInsets.fromLTRB(10, 80, 10, 0),
                      child: TextField(
                        controller: amountController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Amount',
                          hintText: 'Amount',
                        ),
                      ),
                    ),

                    // const SizedBox(height: 5, width: 5,),
                    // ElevatedButton(
                    //   child: const Text('Submit'),
                    //   onPressed: () {},
                    //   style: ElevatedButton.styleFrom(
                    //       padding: const EdgeInsets.fromLTRB(100, 100, 100, 100)
                    //   ),
                    // ),


                    Container(
                        margin: EdgeInsets.all(39),
                        // padding: const EdgeInsets.all(60),
                        padding: EdgeInsets.fromLTRB(84, 100, 20, 20),
                        //   padding: EdgeInsets.only(left:75, bottom: 20, right: 20, top:130),
                        // padding: EdgeInsets.symmetric(horizontal: 110, vertical: 90),

                        child: ElevatedButton(
                          child: const Text('Cash-in with SSLCommerz'),
                          onPressed: () {

                                String amt=amountController.text;
                                print(amt);
                                Navigator.pop(context,amt);


                          },
                        )

                    ),

                    // ElevatedButton(
                    //
                    //   child: Text('Cash-in with SSLCommerz'
                    //
                    //   ),
                    //   onPressed: (){},
                    //
                    //   style: ElevatedButton.styleFrom(
                    //       padding: const EdgeInsets.fromLTRB(10, 80, 10, 0)
                    //   ),
                    //
                    // )

                  ],
                )
            ),




          ]
    )
      ),

    );
  }

}