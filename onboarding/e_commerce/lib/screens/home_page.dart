import 'package:e_commerce/data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 251, 251),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('assets/images/avatar.jpg'),
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'July 14,2023',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.withAlpha(100),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hello ,',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              TextSpan(
                                text: 'Yohannes',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Icon(Icons.notification_add_outlined, size: 16),
                ),
              ],
            ),

            SizedBox(height: 35),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: BoxBorder.all(color: Colors.grey.withAlpha(90)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.search_outlined,
                    color: Colors.grey.withAlpha(90),
                  ),
                ),
              ],
            ),

            //
            Expanded(child: ListView(children: data)),
          ],
        ),
      ),

      floatingActionButton: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 38, 38, 231),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
