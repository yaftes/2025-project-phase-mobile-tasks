import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/services/product_service.dart';
import 'package:e_commerce/core/utils/helpers.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final _product = ModalRoute.of(context)!.settings.arguments as Product;

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
                  image: AssetImage(
                    "assets/images/${_product.imagePath ?? 'jacket.jpg'}",
                  ),
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
                        _product.category,
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
                        _product.name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('\$${_product.price.toString()}'),
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

                  Text(_product.description),
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
                        onPressed: () {
                          ProductService.deleteProduct(_product.name);
                          showSnackBar(context, 'Product Deleted');
                          Navigator.pop(context, true);
                        },
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
                        onPressed: () async {
                          final result = await Navigator.pushNamed(
                            context,
                            '/update',
                            arguments: _product,
                          );
                          if (result == true) {
                            setState(() {});
                          }
                        },
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
