import 'package:flutter/material.dart';
import 'package:wallet_app_ui/send_money_other_screen.dart';

class SendMoneyScreen extends StatelessWidget {
  final Map<String, String> _data = {'Citi Bank':'assets/images/citi.png','PNC Bank': 'assets/images/pnc.png',  'HSBC Bank': 'assets/images/hsbc.png',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SendMoneyOtherScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Send Money',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Add your bank account',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Why to add bank account?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Without adding your bank account, you are not able to send money.',
                            style: TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8),
                   CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/person.png'), // Replace with actual image
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  itemCount: _data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    String bankName = _data.keys.elementAt(index);
                    String imagePath = _data.values.elementAt(index);
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      _bankOption(imagePath, bankName),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        height: 250,
        padding: EdgeInsets.zero,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: Text(
                  'Select your Bank',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _bankTile('assets/images/citi.png', 'Citi Bank', '**** 2345'),
              _bankTile('assets/images/hsbc.png', 'HSBC Bank', '**** 4564'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bankOption(String imagePath, String bankName) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [ BoxShadow(
                  color: Colors.black,
                  blurRadius: 1.0,
                ),]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(imagePath,fit: BoxFit.fill,),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          bankName,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _bankTile(String imagePath, String bankName, String accountNumber) {
    return ListTile(
      leading:  Container(
        height: 80,
        width: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
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
      title: Text(
        bankName,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(accountNumber),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {},
    );
  }
}
