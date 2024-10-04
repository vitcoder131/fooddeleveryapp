import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Màu nền trắng
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black),
            ),
            Image.asset(
              "images/salad2.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mediteranace ", style: AppWidget.semiBooldTextFeildStyle()),
                    Text("Chickpea Salad ", style: AppWidget.semiBooldTextFeildStyle()),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.remove, color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),
                Text(a.toString(), style: AppWidget.semiBooldTextFeildStyle()),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    ++a;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Text(
              "This chickpea salad is healthy, satisfying, flavorful, and fresh. It’s exactly the sort of thing I like to make for picnics and lunches throughout the summer. Just add a side of sunshine to make it a meal. Enjoy!",
              maxLines: 3,
              style: AppWidget.LightTextFeildStyle(),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text("Delivery Time", style: AppWidget.semiBooldTextFeildStyle()),
                SizedBox(width: 7),
                Icon(Icons.alarm, color: Colors.black54),
                SizedBox(width: 7),
                Text("30m", style: AppWidget.semiBooldTextFeildStyle()),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total Price", style: AppWidget.semiBooldTextFeildStyle()),
                      Text("\$28", style: AppWidget.boldTextFeildStyle()),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add to cart", style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Poppins')),
                        SizedBox(width: 30),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                          child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
