import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Product product;
  final void Function() onDelete;

  const CustomCard({required this.product, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Navigator.pushNamed(
          context,
          '/detail',
          arguments: product,
        );

        if (result == true) {
          onDelete();
        }
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
                  image: AssetImage(
                    'assets/images/${product.imagePath ?? 'jacket.jpg'}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                title: Text(product.name),
                subtitle: Text(
                  product.category,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.withAlpha(90),
                  ),
                ),
                trailing: Column(
                  children: [
                    Text(
                      '\$${product.price.toString()}',
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
