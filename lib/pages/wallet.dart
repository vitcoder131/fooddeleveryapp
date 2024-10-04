import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  String? wallet = "100"; // Khởi tạo giá trị ví
  String? id;
  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: wallet == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(top: 60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 2.0,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Center(
                        child: Text(
                          "Wallet",
                          style: AppWidget.HeadlineTextFeildStyle(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _buildWalletInfo(),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Add money",
                      style: AppWidget.semiBooldTextFeildStyle(),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  _buildAmountButtons(),
                  SizedBox(height: 50.0),
                  _buildAddMoneyButton(),
                ],
              ),
            ),
    );
  }

  Widget _buildWalletInfo() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Color(0xFFF2F2F2)),
      child: Row(
        children: [
          Image.asset(
            "images/wallet.png",
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 40.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your Wallet", style: AppWidget.LightTextFeildStyle()),
              SizedBox(height: 5.0),
              Text("\$${wallet!}", style: AppWidget.boldTextFeildStyle()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAmountButtons() {
    List<String> amounts = ["100", "500", "1000", "2000"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: amounts.map((amount) {
        return GestureDetector(
          onTap: () {
            setState(() {
              wallet = (int.parse(wallet!) + int.parse(amount)).toString();
            });
          },
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE9E2E2)),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              "\$$amount",
              style: AppWidget.semiBooldTextFeildStyle(),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAddMoneyButton() {
    return GestureDetector(
      onTap: () {
        openEdit();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        padding: EdgeInsets.symmetric(vertical: 12.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color(0xFF008080),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            "Add Money",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Future openEdit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.cancel),
                        ),
                        SizedBox(width: 60.0),
                        Center(
                          child: Text(
                            "Add Money",
                            style: TextStyle(
                              color: Color(0xFF008080),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text("Amount"),
                    SizedBox(height: 10.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38, width: 2.0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: amountController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Amount',
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            int amount = int.tryParse(amountController.text) ?? 0;
                            wallet = (int.parse(wallet!) + amount).toString();
                          });
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color(0xFF008080),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Pay",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
}
