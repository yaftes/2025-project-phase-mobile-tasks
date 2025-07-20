import 'package:e_commerce/screens/detail_page.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              imageName: widget.imageName,
              name: widget.name,
              category: widget.category,
              description: widget.description,
              price: widget.price,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),

        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(22),
                  topRight: Radius.circular(22),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/${widget.imageName}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                title: Text(widget.name),
                subtitle: Text(
                  widget.category,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.withAlpha(90),
                  ),
                ),
                trailing: Column(
                  children: [
                    Text(
                      '\$${widget.price.toString()}',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: Colors.amberAccent, size: 18),
                        SizedBox(width: 5),
                        Text(
                          '(4.0)',
                          style: TextStyle(color: Colors.grey.withAlpha(90)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
