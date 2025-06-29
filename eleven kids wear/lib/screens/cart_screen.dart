import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية للسلة
    final List<Map<String, dynamic>> cartItems = [
      {
        'name': 'بجامة أطفال شتوي',
        'price': 'EGP 500',
        'image': 'assets/images/بجامة.png',
        'quantity': 1,
      },
      {
        'name': 'تيشيرت صيفي',
        'price': 'EGP 250',
        'image': 'assets/images/tshirt.png',
        'quantity': 2,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('سلة المشتريات'),
        backgroundColor: Color(0xFF660652),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.asset(item['image'], width: 50),
              title: Text(item['name']),
              subtitle: Text('${item['price']} × ${item['quantity']}'),
              trailing: Icon(Icons.delete_outline, color: Colors.red),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 8)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('الإجمالي: EGP 1000', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {
                // إجراء الدفع
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: Text('ادفع الآن'),
            ),
          ],
        ),
      ),
    );
  }
}
