import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallet_app_ui/send_money_screen.dart';

import 'models/cardmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BankingHomePage(),
    );
  }
}

class BankingHomePage extends StatelessWidget {
  List<CardModel> cards = [
    CardModel(
      cardType: "VISA",
      balance: "\$5,250.20",
      cardNumber: "**** 3456",
      expiryDate: "10/24",
      cardColor: Colors.blueAccent,
    ),
    CardModel(
      cardType: "MasterCard",
      balance: "\$2,850.75",
      cardNumber: "**** 9876",
      expiryDate: "08/25",
      cardColor: Colors.deepPurple,
    ),
    CardModel(
      cardType: "AMEX",
      balance: "\$7,600.00",
      cardNumber: "**** 1122",
      expiryDate: "12/23",
      cardColor: Colors.teal,
    ),
    CardModel(
      cardType: "Rupay",
      balance: "\$1,150.50",
      cardNumber: "**** 7788",
      expiryDate: "05/26",
      cardColor: Colors.orangeAccent,
    ),
  ];
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pinkAccent,
        child: Icon(Icons.account_balance_wallet, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "My Cards",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade50),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ))
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: controller,
                itemCount: cards.length,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {},
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 300,
                    margin: EdgeInsets.only(right: 10),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: cards[index].cardColor,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                cards[index].cardType,
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Text(
                              "Balance",
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 14),
                            ),
                            SizedBox(height: 5),
                            Text(
                              cards[index].balance.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  cards[index].cardNumber.toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  cards[index].expiryDate.toString(),
                                  style: GoogleFonts.poppins(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: cards.length,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Colors.grey.shade900),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionButton('assets/images/send_money.png', "Send", context),
                _actionButton('assets/images/pay.png', "Pay", context),
                _actionButton('assets/images/bills.png', "Bills", context),
            /*    _actionButton(Icons.send, "Send", context),
                _actionButton(Icons.payment, "Pay", context),
                _actionButton(Icons.receipt, "Bills", context),*/
              ],
            ),
            SizedBox(height: 20),
            _menuOption('assets/images/statistics.png', "Statistics", "Payments and Income"),
            _menuOption('assets/images/transaction.png', "Transactions", "Transaction history"),
          ],
        ),
      ),
    );
  }
  Widget _actionButton(String imagePath, String label, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SendMoneyScreen())),
      child: Column(
        children: [
          Card(
            color: Colors.white,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                /*  boxShadow: [ BoxShadow(
                color: Colors.black,
                blurRadius: 1.0,
              ),]*/
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagePath,fit: BoxFit.fill,),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
 /* Widget _actionButton(IconData icon, String label, BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SendMoneyScreen())),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(icon, color: Colors.deepPurpleAccent, size: 30),
          ),
          SizedBox(height: 5),
          Text(label,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500))
        ],
      ),
    );
  }
*/
  Widget _menuOption(String imagePath, String title, String subtitle) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: Image.asset(imagePath,fit: BoxFit.fill,),
          title: Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            subtitle,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
