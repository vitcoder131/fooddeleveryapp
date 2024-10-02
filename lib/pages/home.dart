import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/details.dart';
import 'package:fooddeliveryapp/service/database.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool icecream = false, salad = false, burger = false, pizza = false; 
  @override

  Stream? fooditemsStream;

  ontheload()async{
    fooditemsStream = await DatabaseMethods().getFoodItem("Pizza");
    setState(() {
      
    });
  }
  @override
  void initState() {
    ontheload();
    super.initState();
    
  }

  Widget allItems(){
    return StreamBuilder(stream: fooditemsStream,builder: (context, AsyncSnapshot snapshot){
    return snapshot.hasData? ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: snapshot.data.docs.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index){
          
    }):CircularProgressIndicator();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        margin: EdgeInsets.only(top: 50, left: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hello,Bao,", style: AppWidget.boldTextFeildStyle()
            ),
          
        Container(
          margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
        child: Icon(Icons.shopping_cart, color: Colors.white,),
        )
      ],
      ),
      SizedBox(height: 20,),
       Text("Delicious Food,", style: AppWidget.HeadlineTextFeildStyle()
            ),
            Text("Discover and Get Great Food,", style: AppWidget.LightTextFeildStyle()
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(right:20),
              child: showItem()),
            SizedBox(height: 20.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Details()));
                  },
                  child: Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("images/salad2.png", height: 150, width: 150, fit: BoxFit.cover,),
                            Text("Veggie Taco Hask", 
                            style: AppWidget.semiBooldTextFeildStyle(),),
                            SizedBox(height: 5.0,),
                            Text("Fresh and Healthy", style: AppWidget.LightTextFeildStyle(),),
                            SizedBox(height: 5.0,),
                            Text("\$25", 
                            style: AppWidget.semiBooldTextFeildStyle(),),
                          ],
                        )),
                    ),
                  ),
                ),
                SizedBox(width: 15,),
                Container(
                  margin: EdgeInsets.all(4),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset("images/salad2.png", height: 150, width: 150, fit: BoxFit.cover,),
                          Text("Mix Vege Salad", 
                          style: AppWidget.semiBooldTextFeildStyle(),),
                          SizedBox(height: 5.0,),
                          Text("Spice and Onion", style: AppWidget.LightTextFeildStyle(),),
                          SizedBox(height: 5.0,),
                          Text("\$28", 
                          style: AppWidget.semiBooldTextFeildStyle(),),
                        ],
                      )),
                  ),
                )
              ],),
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Details()));
              }, 
              child: Container(
                margin: EdgeInsets.only(right: 20),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("images/salad2.png", height: 150,width: 150, fit: BoxFit.cover),
                      SizedBox(width: 20,),
                      Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child:
                          Text("Mediterance Chick Salad", style: AppWidget.semiBooldTextFeildStyle(),)
                          ),
                          SizedBox(height: 5,),
                          Container(
                          width: MediaQuery.of(context).size.width/2,
                          child:
                          Text("Honey goot cheese", style: AppWidget.LightTextFeildStyle(),)
                          ),
                          SizedBox(height: 5,),
                          Container(
                          width: MediaQuery.of(context).size.width/2,
                          child:
                          Text("\$28", style: AppWidget.semiBooldTextFeildStyle(),)
                          ),
                      ],)
                      ],),),
                ),
              ),
            )
          ]
      ),
      ),
    );
  }
  Widget showItem(){
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              GestureDetector(
              onTap: (){
              icecream = true;
              pizza = false;
              salad = false;
              burger = false;
              setState(() {
            });
              },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(color: icecream?Colors.black: Colors.white, borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(8),
                    child: Image.asset("images/ice-cream.png", height: 60, width: 60,fit: BoxFit.cover,color: icecream?Colors.white: Colors.black ),
                    ),
                ),
              ),
              GestureDetector(
              onTap: (){
              icecream = false;
              pizza = true;
              salad = false;
              burger = false;
              setState(() {
            });
              },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(color: pizza?Colors.black: Colors.white, borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(8),
                    child: Image.asset("images/pizza.png", height: 60, width: 60,fit: BoxFit.cover,color: pizza?Colors.white: Colors.black ),
                    ),
                ),
              ),
              GestureDetector(
              onTap: (){
              icecream = false;
              pizza = false;
              salad = true;
              burger = false;
              setState(() {
            });
              },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(color: salad?Colors.black: Colors.white, borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(8),
                    child: Image.asset("images/salad.png", height: 60, width: 60,fit: BoxFit.cover,color: salad?Colors.white: Colors.black ),
                    ),
                ),
              ),
              GestureDetector(
              onTap: (){
              icecream = false;
              pizza = false;
              salad = false;
              burger = true;
              setState(() {
            });
              },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(color: burger?Colors.black: Colors.white, borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(8),
                    child: Image.asset("images/burger.png", height: 60, width: 60,fit: BoxFit.cover,color: burger?Colors.white: Colors.black ),
                    ),
                ),
              ),
            ],);
  }
}