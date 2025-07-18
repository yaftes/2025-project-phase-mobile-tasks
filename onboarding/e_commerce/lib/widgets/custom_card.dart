import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String imageName;
  final String name;
  final String category;
  final double price;
  final String description;
  const CustomCard({
    required this.imageName,
    super.key,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      elevation: 4,
      child: Column(
        children: [
          Image.asset(
            "assets/images/${widget.imageName}",
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ListTile(
              title: Text(widget.name),
              subtitle: Text(widget.category),
              trailing: Column(
                children: [Text(widget.price.toString()), Text('(4.0)')],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
