
import 'package:flutter/material.dart';
import 'package:flutterproject/Accounts/HomePage.dart';
import 'package:flutterproject/DASH/dashboard.dart';
import 'package:flutterproject/Dashboard2/dash2.dart';
import 'package:flutterproject/Accounts/Sign_Up.dart';

class LoanApply extends StatefulWidget {
  const LoanApply({Key? key}) : super(key: key);

  @override
  State<LoanApply>createState() => my_LoanApply();
}

class my_LoanApply extends State<LoanApply> {

  TextEditingController amountController = TextEditingController();
  TextEditingController timeController = TextEditingController();

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



                        // Text(
                        //
                        //   'Apply for Loan',
                        //   style: TextStyle(
                        //     fontSize: 35,
                        //     foreground: Paint()
                        //       ..style = PaintingStyle.stroke
                        //       ..strokeWidth = 7
                        //       ..color = Colors.blue[700]!,
                        //   ),
                        //
                        //   textAlign: TextAlign.center,
                        // ),
                        // // Solid text as fill.
                        // Text(
                        //   'Apply for Loan',
                        //   style: TextStyle(
                        //     fontSize: 35,
                        //     color: Colors.grey[300],
                        //
                        //   ),
                        //   textAlign: TextAlign.center,
                        // ),

                        Text(
                          'Apply for Loan',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.blueAccent[700],

                          ),
                          textAlign: TextAlign.center,
                        ),


                        // Container(
                        //   padding: const EdgeInsets.all(10),
                        //   child: TextField(
                        //     controller: amountController,
                        //
                        //     decoration: const InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       labelText: 'Amount',
                        //     ),
                        //   ),
                        // ),
                        //
                        // Container(
                        //   padding: const EdgeInsets.all(10),
                        //   child: TextField(
                        //     controller: timeController,
                        //
                        //     decoration: const InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       labelText: 'Time',
                        //     ),
                        //   ),
                        // ),
                        //


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


                        Padding(
                          //padding: EdgeInsets.all(39),
                          padding: EdgeInsets.fromLTRB(10, 170, 10, 0),
                          child: TextField(
                            controller: timeController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Time',
                              hintText: 'Time',
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
                            margin: EdgeInsets.all(100),
                            // padding: const EdgeInsets.all(60),
                            padding: EdgeInsets.fromLTRB(28, 140, 20, 0),
                            //   padding: EdgeInsets.only(left:75, bottom: 20, right: 20, top:130),
                            // padding: EdgeInsets.symmetric(horizontal: 110, vertical: 90),

                            child: ElevatedButton(
                              child: const Text('Submit'),
                              onPressed: () {

                                String amt=amountController.text;
                                print(amt);
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