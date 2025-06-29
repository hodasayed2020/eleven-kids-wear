import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حسابي'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            SizedBox(height: 16),
            Text("اسم المستخدم", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("email@example.com", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text("تعديل الحساب"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("تسجيل الخروج"),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
