import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: ClipRRect(),
          ),

          title: ListTile(
            title: Text(
              'july 14, 2023',
              style: TextStyle(fontSize: 10, color: Colors.grey.withAlpha(90)),
            ),
            subtitle: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Hello, '),
                  TextSpan(
                    text: 'Yohannes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: BoxBorder.all(color: Colors.grey),
                ),
                child: Icon(Icons.notification_add_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
