import 'package:fooddeliveryapp/admin/home_admin.dart';
import 'package:fooddeliveryapp/pages/login.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? name = "Quoc Bao"; // Giả sử tên người dùng
  String? email = "baongocnghech04@gmail.com"; // Giả sử email người dùng

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 6.5),
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(60),
                child: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/boy.jpg"), // Hình ảnh đại diện
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                name ?? "Name",
                style: const TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            buildProfileDetail("Name", name),
            const SizedBox(height: 30.0),
            buildProfileDetail("Email", email),
            const SizedBox(height: 30.0),
            buildActionButton("Upload Food"),
            const SizedBox(height: 30.0),
            buildActionButton("Delete Account"),
            const SizedBox(height: 30.0),
            buildActionButton("LogOut"),
          ],
        ),
      ),
    );
  }

  Widget buildProfileDetail(String title, String? value) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 2.0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const Icon(Icons.person, color: Colors.black),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (value != null)
                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildActionButton(String title) {
    return GestureDetector(
      onTap: () {
        if (title == "LogOut") {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> LogIn())); // Điều hướng đến trang Login
        }
        if (title == "Upload Food") {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeAdmin())); // Điều hướng đến trang Login
        } else {
          // Xử lý sự kiện khi nhấn nút xóa tài khoản
          print('$title pressed');
        }
      },
      
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 2.0,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  title == "Delete Account" ? Icons.delete : Icons.logout,
                  color: Colors.black,
                ),
                const SizedBox(width: 20.0),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
