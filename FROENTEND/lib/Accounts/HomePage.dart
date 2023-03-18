import 'package:flutter/material.dart';
import 'package:flutterproject/Accounts/Login.dart';
import 'package:flutterproject/main.dart';
import 'package:flutterproject/Accounts/Sign_Up.dart';
import "package:http/http.dart" as http;



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _myhomepage();

//static const String _title1 = 'Welcome to A2F';

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text("aaaaaaaaaa"),),
//     body: Center(child: Image.asset('assets/a2fgif.gif'),),
//   );
// }
}

class _myhomepage extends State<Homepage>{

@override
  Widget build(BuildContext context)
{
  return Scaffold(

    drawer: NavDrawer(),
    appBar: AppBar(
      title: Text('A2F'),
    ),


body: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children:<Widget>[

      Container(
        height: 600,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/a2fgif.gif'),

        fit: BoxFit.cover,

      )
    ),

      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Stack(
        children:<Widget> [



          Text(

            'Welcome to A2F',
            style: TextStyle(
              fontSize: 40,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 6
                ..color = Colors.blue[700]!,
            ),

            textAlign: TextAlign.center,
          ),
          // Solid text as fill.
          Text(
            'Welcome to A2F',
            style: TextStyle(
              fontSize: 40,
              color: Colors.grey[300],

            ),
            textAlign: TextAlign.center,
          ),


          // Row(children:<Widget> [
          //   new RaisedButton(
          //     child: new Text("Button_1"),
          //     onPressed: null,
          //   ),
          //   new RaisedButton(
          //     child: new Text("Button_2"),
          //     onPressed: null,
          //   )
          // ])
          //

          // Container(
          //   child: new Row(
          //     children: <Widget>[
          //       Container(
          //        padding: EdgeInsets.only(left:55, bottom: 20, right: 20, top:100),
          //         child: ElevatedButton(
          //           child: const Text('Sign Up'),
          //           onPressed: ()
          //           {
          //
          //           },
          //         ),
          //       ),
          //
          //
          //       Container(
          //         padding: EdgeInsets.only(left:75, bottom: 20, right: 20, top:100),
          //         //margin: EdgeInsets.all(29),
          //         //padding: const EdgeInsets.all(50),
          //         child: ElevatedButton(
          //           child: const Text('Log In'),
          //           onPressed: ()
          //           {
          //
          //           },
          //         ),
          //       )
          //     ],
          //   ),
          // )



          //Row()
          Container(
           // margin: EdgeInsets.all(29),
                //padding: const EdgeInsets.all(40),
             // padding: EdgeInsets.only(left:75, bottom: 20, right: 20, top:100),
            //padding: EdgeInsets.symmetric(horizontal: 110, vertical: 50),
              padding: EdgeInsets.fromLTRB(115, 90, 20, 20),
                child: ElevatedButton(
                  child: const Text('Sign Up'),
                  onPressed: () {

                    Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp()),) ;
                  },
                )

          ),
          //
          Container(
              margin: EdgeInsets.all(39),
             // padding: const EdgeInsets.all(60),
              padding: EdgeInsets.fromLTRB(84, 100, 20, 20),
           //   padding: EdgeInsets.only(left:75, bottom: 20, right: 20, top:130),
             // padding: EdgeInsets.symmetric(horizontal: 110, vertical: 90),

              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Login()),) ;

                },
              )

          ),

        ],
      )
      ),


      Container(

        child: new Column(
          children: <Widget>[
         // padding: EdgeInsets.all(8.0),
          new Text(
            "ABOUT US!",
            style: TextStyle(color: Colors.blueGrey, fontSize:35,fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
          ),

            new Text(
              "A2F is a community based lending application where funds will be available anywhere and anytime.The mission of A2F is to provide short term loans within a specified community and also raise funds for that community welfare.",
              style: TextStyle(color: Colors.blueGrey, fontSize:10, ), textAlign: TextAlign.center,
            ),
          ]
        ),

       // child: Text("aaaaaaaaaaaaaaaa",style: TextStyle(color:Colors.blueGrey,fontSize:20)),

      ),

      Container(

        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "___________________",
            style: TextStyle(color: Colors.blueGrey, fontSize:35),
          ),
        ),

        // child: Text("_____________",style: TextStyle(color:Colors.blueGrey,fontSize:20)),

      )


   ]
  ),
  );
}





}

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/money2.webp'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text('User SignUp'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('User LogIn'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Admin Login'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Agent Login'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}