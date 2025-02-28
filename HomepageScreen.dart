import 'package:final_project/features/presentation/ProfileSetting.dart';
import 'package:final_project/features/presentation/notificationScreen.dart';
import 'package:final_project/features/presentation/productDetailScreen.dart';
import 'package:final_project/features/presentation/searchScreen.dart';
import 'package:final_project/features/presentation/wishlistScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'ProfileScreen.dart';
import 'cartScreen.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void changePage(int index) => emit(index);
}

class HomePage extends StatelessWidget {
  final List<Widget> pages = [
    HomeContent(),
    SearchScreen(),
    WishlistScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (index) => context.read<NavigationCubit>().changePage(index),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Browse'),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
            body: pages[currentIndex],
          );
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 360,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFFFDA56C), Color(0xFFFEB5AE), Color(0xFFFD6C8A)]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location', style: TextStyle(color: Colors.white70)),
                            Text('Condong Catur', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
                          },
                          icon: Icon(Icons.notifications_active, color: Colors.white),
                        ),
                        SizedBox(width: 10),
                        CircleAvatar(
                          child: SvgPicture.asset("assets/images/im4.svg"),
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text("Find best device for\nyour setup!", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
                    },
                    child: Container(
                      height: 150,
                      width: 335,
                      decoration: BoxDecoration(
                        color: Color(0xFF759BFD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("New Bing\nWireless\nEarphone", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                            Image.asset("assets/images/Image.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hot deals 🔥', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return productCard(context, products[index]['name']!, products[index]['price']!, products[index]['imageUrl']!);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget productCard(BuildContext context, String name, String price, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsScreen()));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          children: [
            Expanded(child: Image.asset(imageUrl, fit: BoxFit.cover)),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(price, style: TextStyle(color: Colors.blueAccent)),
          ],
        ),
      ),
    );
  }
}

List<Map<String, String>> products = [
  {'name': 'Macbook Pro 16"', 'price': '\$1240', 'imageUrl': 'assets/images/macbook_PNG101747.png'},
  {'name': 'Wireless Earbuds', 'price': '\$462', 'imageUrl': 'assets/images/OIP (1).jpeg'},
  {'name': 'Sound White Speaker', 'price': '\$240', 'imageUrl': 'assets/images/OIP (1).jpeg'},
  {'name': 'Apple AirPods', 'price': '\$108', 'imageUrl': 'assets/images/OIP (1).jpeg'},
];
