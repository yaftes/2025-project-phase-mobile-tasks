import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String imageName;
  final String name;
  final String category;
  final double price;
  final String description;

  const DetailPage({
    super.key,
    required this.imageName,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 251, 251),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/${widget.imageName}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.category,
                        style: TextStyle(
                          color: Colors.grey.withAlpha(90),
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 20, color: Colors.amberAccent),
                          Text(
                            '(4.0)',
                            style: TextStyle(color: Colors.grey.withAlpha(90)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('\$${widget.price.toString()}'),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text('Size:', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildTextContainer(31),
                        _buildTextContainer(32),
                        _buildTextContainer(33),
                        _buildTextContainer(34),
                        _buildTextContainer(
                          35,
                          color: Color.fromARGB(255, 38, 38, 231),
                        ),
                        _buildTextContainer(36),
                        _buildTextContainer(37),
                        _buildTextContainer(38),
                        _buildTextContainer(39),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(widget.description),
                  SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 50,
                            vertical: 10,
                          ),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8),
                            side: BorderSide(color: Colors.redAccent),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'DELETE',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 10,
                          ),
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 38, 38, 231),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 50,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'UPDATE',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextContainer(int size, {Color? color = Colors.white}) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          size.toString(),
          style: TextStyle(
            color: color == Colors.white ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }
}
