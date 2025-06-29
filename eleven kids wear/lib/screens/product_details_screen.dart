import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  ProductDetailsScreen({
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF660652),
        title: Text(name),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // صورة المنتج
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, height: 250, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),

            // الاسم والسعر
            Text(
              name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              price,
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            SizedBox(height: 20),

            // زر الإضافة للسلة
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF660652),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تمت إضافة المنتج إلى السلة')),
                );
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text('أضف إلى السلة'),
            ),
          ],
        ),
      ),
    );
  }
}
