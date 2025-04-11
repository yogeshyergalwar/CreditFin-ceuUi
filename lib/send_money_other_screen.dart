import 'package:flutter/material.dart';

class SendMoneyOtherScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {"name": "Charlotte", "number": "+1 585 438 0264"},
    {"name": "Michael", "number": "+1 610 244 8974"},
    {"name": "Laura", "number": "+1 234 567 8901"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        /*actions: [Icon(Icons.menu, color: Colors.black)],*/
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Send Money",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Account Selection Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  accountButton("To your\nOwn account", Colors.pink[100]!, Icons.arrow_downward),
                  accountButton("To other\nBank account", Colors.blue[100]!, Icons.arrow_upward),
                ],
              ),

              const SizedBox(height: 20),

              // Search Box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Send to your mobile contact",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Enter Name or Mobile Number",
                          prefixIcon: const Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Contact List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return contactTile(contacts[index]["name"]!, contacts[index]["number"]!);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget accountButton(String text, Color color, IconData icon) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget contactTile(String name, String number) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, color: Colors.grey[700]),
      ),
      title: Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Text(number, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}
