import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text('Your Notification', style: TextStyle(color: Colors.black, fontSize:24, fontWeight: FontWeight.w600 )),
          _buildSectionTitle('Today'),
          _buildNotificationItem('30% Special Discount!', 'Special promotion only valid today', Icons.local_offer, Colors.redAccent),
          _buildNotificationItem('New Apple Promotion', 'Special promo to all Apple devices', Icons.phone_iphone, Colors.grey),
          SizedBox(height:5),
          _buildSectionTitle('Yesterday'),
          _buildNotificationItem('Special Offer! 40% Off', 'Special offer for new accounts, valid until 20 Nov 2022', Icons.local_offer, Colors.redAccent),
          _buildNotificationItem('Special Offer! 50% Off', 'Special offer for new accounts, valid until 20 Nov 2022', Icons.local_offer, Colors.redAccent),
          _buildNotificationItem('Credit Card Connected', 'Special promotion only valid today', Icons.credit_card, Colors.orangeAccent),
          _buildNotificationItem('Account Setup Successful!', 'Special promotion only valid today', Icons.person, Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }

  Widget _buildNotificationItem(String title, String subtitle, IconData icon, Color iconColor) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600])),
      ),
    );
  }
}
