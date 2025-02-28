import 'package:final_project/features/presentation/PrivacyPolicyScreen.dart';
import 'package:final_project/features/presentation/ProfileSetting.dart';
import 'package:final_project/features/presentation/paymentMethodScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(
            fontWeight: FontWeight.w600,fontSize: 18
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/im6.svg'),
            ),
            SizedBox(height: 10),
            Text("Bryan Adam", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("bryan.adam87@gmail.com", style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 20),
            ProfileOption(icon: Icons.location_on, text: "Address",
              ),
            ProfileOption(
              icon: Icons.payment,
              text: "Payment Method",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentMethodScreen()),
                );
              },
            ),
            SwitchListTile(
              title: Text("Notification", style: TextStyle(fontWeight: FontWeight.w600),),
              secondary: Icon(Icons.notifications,color: Colors.grey,),
              value: true,
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              onChanged: (value) {},
            ),
            ProfileOption(icon: Icons.security, text: "Account Security"),
            Divider(),
            ProfileOption(icon: Icons.people, text: "Invite Friends"),
            ProfileOption(icon: Icons.privacy_tip, text: "Privacy Policy",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Privacypolicyscreen()),
                );
              },),
            ProfileOption(icon: Icons.help, text: "Help Center"),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout", style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  ProfileOption({required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(text,style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600
      ),),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
