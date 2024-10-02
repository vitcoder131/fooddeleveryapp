import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/home.dart';
import 'package:fooddeliveryapp/pages/order.dart';
import 'package:fooddeliveryapp/pages/profile.dart';
import 'package:fooddeliveryapp/pages/wallet.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int currentTableindex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Wallet wallet;
  late Order order;
  late Profile profile;
  

@override
  void initState() {
    homepage = Home();
    order = Order();
    wallet = Wallet();
    profile = Profile();
    pages = [homepage, order, wallet, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTableindex = index;
          });
        },
        

        items: [
        Icon(
          Icons.home_outlined, 
          color: Colors.white,),
          Icon(
          Icons.shopping_bag_outlined, 
          color: Colors.white,),
          Icon(
          Icons.wallet_outlined, 
          color: Colors.white,),
          Icon(
          Icons.person_outline, 
          color: Colors.white,),
          ]),
          body: pages[currentTableindex],
    );
  }
}