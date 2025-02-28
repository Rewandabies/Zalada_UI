import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 84,
                height: 21,
                child: Center(child: Text("New Arrival", style: TextStyle(color: Colors.white,fontSize: 13),)),
                decoration: BoxDecoration(
                 color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Center(
              child: Text(
                """Macbook Pro 15\n 2019 - Intel Core i7""",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            // Price Section
            Row(
              mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Text("\$1240", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.blueAccent)),
                SizedBox(width: 8),
                Text("\$1540", style: TextStyle(fontSize: 18, color: Colors.grey, decoration: TextDecoration.lineThrough)),
              ],
            ),
            SizedBox(height: 10,),
            Center(
              child: Image.asset(
                'assets/images/macbook_PNG101747.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),

            SizedBox(height: 16),
            // Color Options
            Center(child: Text("Space Grey", style: TextStyle(color: Colors.grey,fontSize: 16, fontWeight: FontWeight.bold))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildColorOption(Color(0xFFA6A5AA)),
                _buildColorOption(Color(0xFFE8E8EA)),
                _buildColorOption(Color(0xFFF2E0CC)),
              ],
            ),
            SizedBox(height: 16),
            Divider(height: 1,color: Colors.grey.withOpacity(0.3),),
            SizedBox(height: 16),
            // Product Description
            Text("Product Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Text(
              "New variant MacBook Pro 2018 Intel Core i7 with Touch Bar. Its various versions have evolved over the years.",
              style: TextStyle(fontSize: 14, color: Colors.grey,fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 30),
            // Related Products
            Text("Product Related", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            SizedBox(height: 8),
            Container(
              height: 220,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRelatedProduct("""Ipad Pro 2020 11\n128GB""", "\$1029", "assets/images/macbook_PNG101747.png"),
                  SizedBox(width: 50,),
                  _buildRelatedProduct("""Apple Mac Mini\nM1 Chip 2020""", "\$878", "assets/images/OIP (1).jpeg"),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Checkout Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(CupertinoIcons.cart, size: 30,),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom( 
                      backgroundColor: Color(0xFF2D3C52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                    ),
                    onPressed: () {},
                    child: Text("Checkout", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),

      ),
    );
  }

  Widget _buildRelatedProduct(String title, String price, String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imagePath, width: 155, height: 155),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          Text(price, style: TextStyle(fontSize: 12, color: Colors.blue)),
        ],
      ),
    );
  }
}
