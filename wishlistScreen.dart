import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  final List<WishlistModel> wishlistItems = [
    WishlistModel("Macbook Pro 15\"", "\$1240",
        "assets/images/macbook_PNG101747.png", "NEW ARRIVAL"),
    WishlistModel(
        "New True Wireless Earbuds", "\$462", "assets/images/OIP (1).jpeg", ""),
    WishlistModel("Sound White Wireless Portable", "\$240",
        "assets/images/OIP (1).jpeg", ""),
    WishlistModel("Apple AirPods (2nd Gen)", "\$108",
        "assets/images/OIP (1).jpeg", "OUT OF STOCK"),
    WishlistModel("Macbook Pro 15\"", "\$1240",
        "assets/images/macbook_PNG101747.png", "NEW ARRIVAL"),
    WishlistModel(
        "New True Wireless Earbuds", "\$462", "assets/images/OIP (1).jpeg", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Wishlist",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: wishlistItems.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return WishlistItem(item: wishlistItems[index]);
          },
        ),
      ),
    );
  }
}

class WishlistItem extends StatelessWidget {
  final WishlistModel item;
  WishlistItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(item.imagePath,
                        fit: BoxFit.cover, width: double.infinity),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(item.title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(item.price,
                style:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            if (item.tag.isNotEmpty)
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 4),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: item.tag == "OUT OF STOCK"
                        ? Colors.grey
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    item.tag,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class WishlistModel {
  final String title;
  final String price;
  final String imagePath;
  final String tag;

  WishlistModel(this.title, this.price, this.imagePath, this.tag);
}
