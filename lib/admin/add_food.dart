import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/service/database.dart';
import 'package:fooddeliveryapp/widget/widget-support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  final List<String> foodItems = ['Ice-cream', 'Burger', 'Salad', 'Pizza'];
  String? selectedCategory;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadItem() async {
    if (selectedImage != null &&
        nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        detailController.text.isNotEmpty &&
        selectedCategory != null) {
      String addId = randomAlphaNumeric(10);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child("blogImages").child(addId);
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": nameController.text,
        "Price": priceController.text,
        "Detail": detailController.text,
        "Category": selectedCategory,
      };

      DatabaseMethods().addFoodItem; {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Food Item has been added Successfully",
            style: TextStyle(fontSize: 18.0),
          ),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Please fill in all fields"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xFF373866),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add Item",
          style: AppWidget.HeadlineTextFeildStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload the Item Picture",
                style: AppWidget.semiBooldTextFeildStyle(),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: getImage,
                child: Center(
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: selectedImage == null
                          ? const Icon(Icons.camera_alt_outlined, color: Colors.black)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              _buildTextField("Item Name", nameController, "Enter Item Name"),
              const SizedBox(height: 30.0),
              _buildTextField("Item Price", priceController, "Enter Item Price"),
              const SizedBox(height: 30.0),
              _buildTextField("Item Detail", detailController, "Enter Item Detail", maxLines: 6),
              const SizedBox(height: 20.0),
              Text("Select Category", style: AppWidget.semiBooldTextFeildStyle()),
              const SizedBox(height: 20.0),
              _buildCategoryDropdown(),
              const SizedBox(height: 30.0),
              _buildAddButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppWidget.semiBooldTextFeildStyle()),
        const SizedBox(height: 10.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color(0xFFececf8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: AppWidget.LightTextFeildStyle(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: const Color(0xFFececf8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: foodItems.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: (value) => setState(() {
            selectedCategory = value;
          }),
          dropdownColor: Colors.white,
          hint: const Text("Select Category"),
          iconSize: 36,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          value: selectedCategory,
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: uploadItem,
      child: Center(
        child: Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            width: 150,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Add",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
