import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Method", style: TextStyle(
            fontWeight: FontWeight.w600, fontSize: 18
        )),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentOption(
                icon: Icons.credit_card,
                iconColor: Colors.orange,
                text: "MasterCard",
                cardNumber: "**** **** **** 7873"
            ),
            PaymentOption(
                icon: Icons.account_balance_wallet,
                iconColor: Colors.blue,
                text: "Paypal",
                cardNumber: "**** **** **** 4672"
            ),
            PaymentOption(
                icon: Icons.phone_iphone,
                iconColor: Colors.black,
                text: "Apple Pay",
                cardNumber: "**** **** **** 4672"
            ),
            Spacer(),
            Center(
              child: SizedBox(
                width: 335,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    _showAddPaymentBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color(0xFF2D3C52),
                  ),
                  child: Text("Add New Payment", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Add new payment method",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 20),
              PaymentOption(icon: Icons.credit_card, iconColor: Colors.grey, text: "Credit or Debit Card", cardNumber: "Pay with your Visa or Mastercard"),
              PaymentOption(icon: Icons.account_balance_wallet, iconColor: Colors.blue, text: "Paypal", cardNumber: ""),
              PaymentOption(icon: Icons.phone_iphone, iconColor: Colors.black, text: "Apple Pay", cardNumber: ""),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Color(0xFF2D3C52),
                  ),
                  child: Text("Continue", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PaymentOption extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final String cardNumber;

  PaymentOption({required this.icon, required this.iconColor, required this.text, required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
        color: Colors.white,
        child: Center(
          child: ListTile(
            leading: Icon(icon, color: iconColor),
            title: Text(text, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            subtitle: cardNumber.isNotEmpty ? Text(cardNumber, style: TextStyle(color: Colors.grey)) : null,
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
