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
      backgroundColor: Colors.white,
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
                    children: [Text(widget.category), Text('(4.0)')],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.name),
                      Text(widget.price.toString()),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text('Size'),
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
                        _buildTextContainer(35),
                        _buildTextContainer(36),
                        _buildTextContainer(37),
                        _buildTextContainer(38),
                        _buildTextContainer(39),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Text(widget.description),

                  SizedBox(height: 15),
                  Row(children: [
              
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

  Widget _buildTextContainer(int size) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black12),
      ),
      child: Center(child: Text(size.toString())),
    );
  }
}
