import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/details.dart';
import 'package:fooddeliveryapp/service/database.dart';
import 'package:fooddeliveryapp/widget/widget-support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, salad = false, burger = false, pizza = false; 
  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItems() {
    return StreamBuilder(
      stream: fooditemStream,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
          return const Center(child: Text("No items found"));
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data.docs.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data.docs[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                      detail: ds["Detail"],
                      name: ds["Name"],
                      price: ds["Price"],
                      image: ds["Image"],
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            ds["Image"],
                            height: 150.0,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          ds["Name"],
                          style: AppWidget.semiBooldTextFeildStyle(),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "Fresh and Healthy",
                          style: AppWidget.LightTextFeildStyle(),
                        ),
                        const SizedBox(height: 5.0),
                        Text(
                          "\$${ds["Price"]}",
                          style: AppWidget.semiBooldTextFeildStyle(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hello Bao,", style: AppWidget.boldTextFeildStyle()),
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text("Delicious Food", style: AppWidget.HeadlineTextFeildStyle()),
                Text("Discover and Get Great Food", style: AppWidget.LightTextFeildStyle()),
                const SizedBox(height: 20.0),
                showItem(),
                const SizedBox(height: 30.0),
                SizedBox(height: 270, child: allItems()),
                const SizedBox(height: 30.0),
                // Additional content can go here
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            setState(() {
              icecream = true;
              pizza = false;
              salad = false;
              burger = false;
            });
            fooditemStream = await DatabaseMethods().getFoodItem("Ice-cream");
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                color: icecream ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/ice-cream.png",
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        // Similar GestureDetector for pizza, salad, and burger
      ],
    );
  }
}
