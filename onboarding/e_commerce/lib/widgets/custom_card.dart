import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset("assets/images/shoes.jpg"),
          Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text('Derby Leather Shoes'),
              subtitle: Text("men's shoes"),
            ),
          ),
        ],
      ),
    );
  }
}
