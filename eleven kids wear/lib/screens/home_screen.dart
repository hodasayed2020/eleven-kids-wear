import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../screens/login_screen.dart';
import '../screens/product_details_screen.dart';
import '../screens/cart_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

  List<Map<String, dynamic>> products = [
    {
      'name': 'بجامة Phonex Suns',
      'image': 'assets/images/بجامة Phonex Suns.jpg',
      'price': 'EGP 500',
      'isFavorite': false,
    },
    {
      'name': 'بجامة Push Your Limits',
      'image': 'assets/images/بجامة Push Your Limits.jpg',
      'price': 'EGP 620',
      'isFavorite': false,
    },
    {
      'name': 'بجامة Give Me Sun.jpg ',
      'image': 'assets/images/بجامة Give Me Sun.jpg',
      'price': 'EGP 450',
      'isFavorite': false,
    },
    {
      'name': 'بجامهAnyone Love.jpg',
      'image': 'assets/images/بجامة Anyone Love.jpg',
      'price': 'EGP 530',
      'isFavorite': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _pages.addAll([
      buildMainPage(),
      CartScreen(),
      Center(child: Text('دي المفضلة')),
      Center(child: Text('دي حسابي')),
    ]);
  }

  Widget navItem(String title, {List<String>? subItems}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: subItems != null
          ? DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.white,
                iconEnabledColor: Colors.purple,
                hint: Text(title, style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                items: subItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item, style: TextStyle(color: Colors.purple)),
                        ))
                    .toList(),
                onChanged: (value) {
                  // TODO: implement navigation
                },
              ),
            )
          : TextButton(
              onPressed: () {
                // TODO: implement navigation
              },
              child: Text(title, style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
            ),
    );
  }

  Widget buildMainPage() {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: Color(0xFF660652),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(Icons.login, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'مرحبًا بكم في Eleven Kids Wear 👕',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Image.asset('assets/images/لوجو.png', height: 40),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        textDirection: TextDirection.rtl,
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 10),
                          Text("...أنا أبحث عن ", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Icon(Icons.favorite_border, color: Colors.purple),
                      Text("الرغبات", style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Icon(Icons.shopping_cart_outlined, color: Colors.purple),
                      Text("السلة", style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ),

            // شريط التنقل
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: Colors.white,
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                children: [
                  navItem('المنتجات'),
                  navItem('ملابس خروج', subItems: ['بناتي', 'أولادي']),
                  navItem('ملابس منزل', subItems: ['بناتي', 'أولادي']),
                  navItem('ملابس بحر', subItems: ['بناتي', 'أولادي']),
                  navItem('الخصومات'),
                ],
              ),
            ),

            SizedBox(height: 12),

            // بانر رئيسي
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/images/كافر-الشتاء.jpg2_.jpg', fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: 20),

            // المنتجات
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(
                            name: product['name'],
                            image: product['image'],
                            price: product['price'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4)],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 130,
                                width: double.infinity,
                                child: Image.asset(product['image'], fit: BoxFit.cover),
                              ),
                              Positioned(
                                top: 4,
                                right: 4,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      product['isFavorite'] = !product['isFavorite'];
                                    });
                                  },
                                  child: Icon(
                                    product['isFavorite'] ? Icons.favorite : Icons.favorite_border,
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(product['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(product['price']),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset('assets/images/بانر سفلي.jpg', fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}
