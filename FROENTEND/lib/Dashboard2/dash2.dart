import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterproject/Forms/RechargeFoRM.dart';
import 'package:flutterproject/Accounts/HomePage.dart';
import 'package:flutterproject/DASH/dashboard.dart';
import 'package:flutterproject/Dashboard2/dash2.dart';
import 'package:flutterproject/Accounts/Sign_Up.dart';
import 'package:flutterproject/Forms/LoanForm.dart';
import 'package:flutterproject/Forms/withdrawForm.dart';
final Color backgroundColor = Color(0xFF2d2d39);

class TransactionDetails {
  final double loan_amount;
  final double time;

  TransactionDetails({
    required this.loan_amount,
    required this.time,

  });
}

class MenuDashboardPage extends StatefulWidget {
  // final String text;
  // MenuDashboardPage({required Key key,required this.text}):super(key: key);
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>

    with SingleTickerProviderStateMixin {
    String text="";
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 200);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  double mainBorderRadius = 0;

  Brightness statusIconColor = Brightness.dark;

  List<TransactionDetails> todayTransactionsList = [
    new TransactionDetails(
      loan_amount: 200,
      time: 20,

    ),

  ];


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _menuScaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget menuItem({
    required IconData iconData,
    required String title,
    bool active: false,
  }) {
    return SizedBox(
      width: 0.5 * screenWidth,
      child: Container(
        margin: EdgeInsets.only(
          bottom: 20,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Icon(
                iconData,
                color: (active) ? Colors.white : Colors.grey,
                size: 22,
              ),
            ),
            Expanded(
              flex: 14,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  "$title",
                  style: TextStyle(
                    color: (active) ? Colors.white : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 40),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.topLeft,
                        width: 0.3 * screenWidth,
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 10,
                        ),
                        child: ListView(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            SizedBox(
                              height: 0.3 * screenWidth,
                              width: 0.3 * screenWidth,
                              child: Container(
                                alignment: Alignment.topLeft,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage('assets/profile1.jpg')),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            Text(
                              'Tasnia Hoque',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Dhaka, Bangladesh',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[
                      menuItem(
                        title: "DASHBOARD",
                        iconData: Icons.account_balance,
                        active: true,
                      ),
                      menuItem(
                        title: "USER PROFILE",
                        iconData: Icons.account_circle_outlined,
                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                menuItem(
                  title: "Logout",
                  iconData: Icons.exit_to_app,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //aaaaaaaaaaaaaaaaaaaaaaaa

  Widget bottomBar() {
    return Align(
      alignment: Alignment(-1, 1),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: IconButton(
                  highlightColor: Colors.red,
                  splashColor: Colors.greenAccent,
                  icon: Icon(
                    Icons.home,
                    color: Color(0xffa1a5b5),
                  ),
                  iconSize: 28,
                  onPressed: () {},
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                iconSize: 28,
                icon: Icon(
                  Icons.swap_horiz,
                  color: Color(0xffa1a5b5),
                  size: 28,
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  Icons.show_chart,
                  color: Color(0xffa1a5b5),
                ),
                iconSize: 28,
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                iconSize: 28,
                icon: Icon(
                  Icons.notifications_none,
                  color: Color(0xffa1a5b5),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                iconSize: 28,
                icon: Icon(
                  Icons.person_outline,
                  color: Color(0xffa1a5b5),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }





  Widget Wallet({
    required String amount,
    required String cardNumber,
    required String cardHolder,
    required String expiringDate,
    required String bankEnding,            //sssssssssssssssssssssssssss
    required Color backgroundColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width - 30,
      child: Stack(
        children: <Widget>[
          ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            children: <Widget>[
              Text(
                'My Wallet',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                '\nTK.\n$total',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),


              ListTile(
                leading: Icon(Icons.plus_one_outlined),
                title: Text('Recharge Wallet'),
                onTap: () => {
                  catch_amount(context)
                  //Navigator.of(context).pop()
                //Navigator.push(context, MaterialPageRoute(builder:(context)=>Recharge()),)
                },
              ),

              SizedBox(
                height: 20,
              ),

            ],
          ),
          Positioned(
            right: 25,
            top: 25,
            child: SizedBox(
              // width: 90,
              child: Row(
                children: <Widget>[
                  Text(
                    'Bank',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$bankEnding',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 25,
            child: Container(
              child: Icon(
                Icons.credit_card,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );





  }
  String recharge_amount='0';
  String withdraw_amount='0';
  int a=0;
  int total=0;
    void catch_amount(BuildContext context) async{
      final result= await Navigator.push(context, MaterialPageRoute(builder: (context)=> Recharge(),));
      setState(() {
        recharge_amount=result;
      });
           a=int.parse(recharge_amount);
           total+=a;
    }

    void catch_withdraw_amount(BuildContext context) async{
      final result= await Navigator.push(context, MaterialPageRoute(builder: (context)=> withdraw(),));
      setState(() {
        withdraw_amount=result;
      });
      a=int.parse(withdraw_amount);
      total-=a;
    }




  Widget Loan_Num({
    required int loan_num,
    required Color backgroundColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width - 30,
      child: Stack(
        children: <Widget>[
          ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            children: <Widget>[
              Text(
                'No. Of Loans Taken',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                '\n $loan_num',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Positioned(
            right: 25,
            top: 25,
            child: SizedBox(
              // width: 90,
              child: Row(
                children: <Widget>[
                  Text(
                    'Bank',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 25,
            child: Container(
              child: Icon(
                Icons.credit_card,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );


  }



  Widget Loan_Given_Num({
    required int loan_given,
    required Color backgroundColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width - 30,
      child: Stack(
        children: <Widget>[
          ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            children: <Widget>[
              Text(
                'No. Of Loans Given',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                '\n $loan_given',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          Positioned(
            right: 25,
            top: 25,
            child: SizedBox(
              // width: 90,
              child: Row(
                children: <Widget>[
                  Text(
                    'Bank',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 25,
            child: Container(
              child: Icon(
                Icons.credit_card,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );


  }


  Widget Withdraw({
    required double withdraw_amount,
    required Color backgroundColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width - 30,
      child: Stack(
        children: <Widget>[
          ListView(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            children: <Widget>[
              Text(
                'Withdraw From Wallet',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              Text(
                '\n $withdraw_amount',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),


              ListTile(
                leading: Icon(Icons.plus_one_outlined),
                title: Text('- Withdraw'),
                onTap: () => {
                  //Navigator.of(context).pop()
                  catch_withdraw_amount(context)
                 // Navigator.push(context, MaterialPageRoute(builder:(context)=>withdraw()),)
                },
              ),

              SizedBox(
                height: 20,
              ),
            ],
          ),
          Positioned(
            right: 25,
            top: 25,
            child: SizedBox(
              // width: 90,
              child: Row(
                children: <Widget>[
                  Text(
                    'Bank',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 25,
            child: Container(
              child: Icon(
                Icons.credit_card,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );


  }



  Widget transactionList(
      List<TransactionDetails> transactionList,
      String strDate, {
        bool lastElement: false,
      }) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[

        ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 15, 5, (lastElement) ? 40 : 5),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            TransactionDetails _transaction = transactionList[index];
            return Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
              ),
              // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),

                title: Text(
                  "Apply for a New Loan!",

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),


                subtitle: Column(
                  children: <Widget>[
                    // Container(height: 50, color: Colors.red, child: Row()),
                    Container(

                        child: Column(

                          children: <Widget>[
                            TextButton(

                              child: Text("APPLY HERE !"),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder:(context)=>LoanApply()),);
                              },
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromWidth(335),
                                primary: Colors.white,
                                backgroundColor: Colors.green, // Background Color
                              ),

                              
                            ),
                          ],
                        ))
                  ],
                ),

              ),
            );
          },
          itemCount: transactionList.length,
        ),
      ],
    );
  }


  Widget transactionList2(
      List<TransactionDetails> transactionList,
      String strDate, {
        bool lastElement: false,
      }) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[
        // Container(
        //   child: Text(
        //     '$strDate',
        //     style: TextStyle(
        //       color: Color(0xffadb2be),
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),
        ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 15, 5, (lastElement) ? 40 : 5),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            TransactionDetails _transaction = transactionList[index];
            return Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
              ),
              // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),

                title: Text(
                  "Loan Feeds",

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),


                subtitle: Column(
                  children: <Widget>[
                    // Container(height: 50, color: Colors.red, child: Row()),
                    Container(

                        child: Column(

                          children: <Widget>[
                            TextButton(

                              child: Text("REVIEW AND LEND LOANS !"),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromWidth(335),
                                primary: Colors.white,
                                backgroundColor: Colors.blueAccent, // Background Color
                              ),


                            ),

                          ],
                        ))
                  ],
                ),


              ),
            );
          },
          itemCount: transactionList.length,
        ),
      ],
    );
  }


  Widget transactionList3_Fundraising(
      List<TransactionDetails> transactionList,
      String strDate, {
        bool lastElement: false,
      }) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[

        ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 15, 5, (lastElement) ? 40 : 5),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            TransactionDetails _transaction = transactionList[index];
            return Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
              ),
              // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),

                title: Text(
                  "Apply for Fundraising",

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),


                subtitle: Column(
                  children: <Widget>[
                    // Container(height: 50, color: Colors.red, child: Row()),
                    Container(

                        child: Column(

                          children: <Widget>[
                            TextButton(

                              child: Text("APPLY HERE !"),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromWidth(335),
                                primary: Colors.white,
                                backgroundColor: Colors.green, // Background Color
                              ),


                            ),

                          ],
                        ))
                  ],
                ),


              ),
            );
          },
          itemCount: transactionList.length,
        ),
      ],
    );
  }




  Widget transactionList4_donate(
      List<TransactionDetails> transactionList,
      String strDate, {
        bool lastElement: false,
      }) {
    return ListView(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: <Widget>[

        ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 15, 5, (lastElement) ? 40 : 5),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            TransactionDetails _transaction = transactionList[index];
            return Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
              ),
              // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),

                title: Text(
                  "Donate in Fundraising",

                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),


                subtitle: Column(
                  children: <Widget>[
                    // Container(height: 50, color: Colors.red, child: Row()),
                    Container(

                        child: Column(

                          children: <Widget>[
                            TextButton(

                              child: Text("DONATE "),
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromWidth(335),
                                primary: Colors.white,
                                backgroundColor: Colors.blueAccent, // Background Color
                              ),


                            ),

                          ],
                        ))
                  ],
                ),


              ),
            );
          },
          itemCount: transactionList.length,
        ),
      ],
    );
  }





  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      width: screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius: BorderRadius.circular(mainBorderRadius),
          animationDuration: duration,
          color: Color(0xfff4faff),
          child: SafeArea(
              child: Stack(
                children: <Widget>[
                  ListView(
                    padding: EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                          top: 5,
                          bottom: 50,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [


                                  Text(
                                    "My Dashboard",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      color: Color(0xff1c7bfd),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: (MediaQuery.of(context).size.width - 30) *
                                  (8 / 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: PageView(
                                controller: PageController(viewportFraction: 0.9),
                                scrollDirection: Axis.horizontal,
                                pageSnapping: true,
                                children: <Widget>[
                                  Wallet(
                                    amount: '12565.23',
                                    cardHolder: 'Bibash Adhikari',
                                    cardNumber: '4545',
                                    expiringDate: '02/21',
                                    bankEnding: 'X',
                                    backgroundColor: Colors.deepOrangeAccent,
                                  ),

                                  Loan_Num(
                                    loan_num: 4,
                                    backgroundColor: Colors.blueAccent,
                                  ),

                                  Loan_Given_Num(
                                    loan_given: 0,
                                    backgroundColor: Colors.redAccent,
                                  ),

                                  Withdraw(
                                    withdraw_amount: 300,
                                    backgroundColor: Colors.greenAccent,
                                  ),


                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ListView(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: <Widget>[
                            SizedBox(height: 15),
                            Container(
                              padding: EdgeInsets.only(
                                bottom: 16,
                                left: 16,
                                right: 16,
                              ),
                              child: ListView(
                                physics: ClampingScrollPhysics(),
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                shrinkWrap: true,
                                children: <Widget>[
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Transactions",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.settings,
                                          color: Color(0xffa4a6b8),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                  transactionList(todayTransactionsList, 'Apply for a new Loan'),
                                  transactionList2(todayTransactionsList, 'Loan Feeds'),
                                  transactionList3_Fundraising(todayTransactionsList, ''),
                                  transactionList4_donate(todayTransactionsList, ''),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottomBar(),
                ],
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: statusIconColor,
      ),
    );
    return Scaffold(
      drawer: NavDrawer2(),
      appBar: AppBar(
        title: Text('A2F'),
      ),

      backgroundColor: Color(0xff343442),
      body: Stack(
        children: <Widget>[
         // menu(context),
          dashboard(context),
        ],
      ),
    );
  }
}

class NavDrawer2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(




      child: new Column(
          children: <Widget>[
          new Text(
             'Menu',
             style: TextStyle(color: Colors.blueAccent, fontSize: 15),
           ),

            CircleAvatar(
              backgroundImage: AssetImage('assets/profile1.jpg'),

              backgroundColor: Colors.greenAccent,
              radius: 50,
            ),
          ]
      ),



          ),



          ListTile(
            leading: Icon(Icons.account_balance_outlined),
            title: Text('DASHBOARD'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('User PROFILE'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('LOGOUT'),
            onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Homepage()),)
              //Navigator.of(context).pop()

            },
          ),

        ],
      ),
    );
  }
}