import 'dart:async';
import 'package:fooddeliveryapp/pages/wallet.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart'; // Đảm bảo rằng bạn đã định nghĩa các kiểu chữ này

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id, wallet;
  int total = 0;

  List<Map<String, dynamic>> foodItems = []; // Danh sách các món ăn

  @override
  void initState() {
    super.initState();
    fetchFoodItems(); // Gọi hàm để lấy dữ liệu thực phẩm
  }

  void fetchFoodItems() {
    // Dữ liệu thực phẩm mẫu
    foodItems = [
      {
        "Quantity": 1,
        "Image": "images/salad2.png",
        "Name": "Food Item 1",
        "Total": 10
      },
      {
        "Quantity": 2,
        "Image": "images/salad2.png",
        "Name": "Food Item 2",
        "Total": 20
      },
      // Thêm nhiều mục thực phẩm ở đây
    ];
    calculateTotal();
  }

  void calculateTotal() {
    total = foodItems.fold(0, (sum, item) => sum = (item["Total"] * item["Quantity"])); // Tính tổng
    setState(() {}); // Cập nhật giao diện
  }

  void updateQuantity(int index, int change) {
    setState(() {
      foodItems[index]["Quantity"] += change; // Cập nhật số lượng
      if (foodItems[index]["Quantity"] < 1) {
        foodItems[index]["Quantity"] = 1; // Đảm bảo số lượng không âm
      }
      calculateTotal(); // Cập nhật tổng tiền
    });
  }

  Widget foodCart() {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: foodItems.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var item = foodItems[index];
        return Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 90,
                    width: 40,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(item["Quantity"].toString())), // Hiển thị số lượng
                  ),
                  const SizedBox(width: 20.0),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      item["Image"],
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item["Name"],
                        style: AppWidget.semiBooldTextFeildStyle(),
                      ),
                      Text(
                        "\$${item["Total"] * item["Quantity"]}", // Hiển thị tổng tiền cho món
                        style: AppWidget.semiBooldTextFeildStyle(),
                      ),
                    ],
                  ),
                  const Spacer(), // Đẩy các phần tử về bên trái
                  Column(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => updateQuantity(index, 1), // Tăng số lượng
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () => updateQuantity(index, -1), // Giảm số lượng
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    "Food Cart",
                    style: AppWidget.HeadlineTextFeildStyle(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: foodCart(),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: AppWidget.boldTextFeildStyle(),
                  ),
                  Text(
                    "\$$total",
                    style: AppWidget.semiBooldTextFeildStyle(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: GestureDetector(
                onTap: () {
                  // Điều hướng đến trang Login hoặc thực hiện hành động checkout
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Wallet()));
                },
                child: const Center(
                  child: Text(
                    "CheckOut",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
