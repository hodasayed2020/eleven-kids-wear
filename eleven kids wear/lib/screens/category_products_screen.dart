import 'package:flutter/material.dart';

class CategoryProductsScreen extends StatelessWidget {
  final String categoryName;

  const CategoryProductsScreen({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // هنا هتفلتر المنتجات على حسب اسم الكاتيجوري
    return Scaffold(
      appBar: AppBar(
        title: Text('منتجات: $categoryName'),
        backgroundColor: Color(0xFF660652),
      ),
      body: Center(
        child: Text('هنا المنتجات الخاصة بـ $categoryName'),
      ),
    );
  }
}
