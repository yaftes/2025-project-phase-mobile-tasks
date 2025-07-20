import 'package:flutter/material.dart';

class AddUpdatePage extends StatelessWidget {
  const AddUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 251, 251),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.arrow_back_ios_new,
          color: const Color.fromARGB(255, 38, 38, 231),
          size: 14,
        ),
        backgroundColor: const Color.fromARGB(255, 252, 251, 251),
        title: Center(
          child: Text('Add Product', style: TextStyle(fontSize: 14)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 237, 236, 236),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image_outlined, size: 40),
                    SizedBox(height: 15),
                    Text('upload image', style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text('name'),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 234, 234, 234),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 10),
              Text('category'),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 234, 234, 234),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 10),
              Text('price'),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 234, 234, 234),
                  border: OutlineInputBorder(borderSide: BorderSide.none),

                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      '\$',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                  suffixIconConstraints: BoxConstraints(
                    minWidth: 0,
                    minHeight: 0,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('description'),

              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 234, 234, 234),
                  border: InputBorder.none,
                ),
              ),

              SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Color.fromARGB(255, 38, 38, 231),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Add', style: TextStyle(color: Colors.white)),
                ),
              ),

              SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      side: BorderSide(color: Colors.redAccent),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
