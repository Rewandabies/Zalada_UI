import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<ProductModel> products = [
    ProductModel("Macbook Pro 15\"", "\$1240", "assets/images/macbook_PNG101747.png", "NEW ARRIVAL"),
    ProductModel("New True Wireless Earbuds", "\$462", "assets/images/OIP (1).jpeg", ""),
    ProductModel("Sound White Wireless Portable", "\$240", "assets/images/OIP (1).jpeg", ""),
    ProductModel("Apple AirPods (2nd Gen)", "\$108", "assets/images/OIP (1).jpeg", "OUT OF STOCK"),
    ProductModel("Macbook Pro 15\"", "\$1240", "assets/images/macbook_PNG101747.png", "NEW ARRIVAL"),
    ProductModel("New True Wireless Earbuds", "\$462", "assets/images/OIP (1).jpeg", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search laptop, headset...",
              hintStyle: TextStyle(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4), width: 2),
              ),
              prefixIcon: Icon(Icons.search, color: Colors.black),
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return ProductItem(product: products[index]);
          },
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final ProductModel product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
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
                    child: Image.asset(product.imagePath, fit: BoxFit.cover, width: double.infinity),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(product.title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(product.price, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
            if (product.tag.isNotEmpty)
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: product.tag == "OUT OF STOCK" ? Colors.grey : Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    product.tag,
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ProductModel {
  final String title;
  final String price;
  final String imagePath;
  final String tag;

  ProductModel(this.title, this.price, this.imagePath, this.tag);
}
