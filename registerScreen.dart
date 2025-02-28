import 'package:flutter/material.dart';

import 'HomepageScreen.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(right: 170),
                child: Text("""Create your new account.""",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),

                ),
              ),
              SizedBox(height: 16),
              Text("Email address", style: TextStyle(color: Colors.grey),),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email Address",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10)
                  ),

                ),
              ),
              SizedBox(height: 16),
              Text("Password",style: TextStyle(color: Colors.grey),),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  suffixIcon: Icon(Icons.visibility_outlined, color: Colors.grey),
                ),
              ),
              SizedBox(height: 16),
              Text("Confirm Password",style: TextStyle(color: Colors.grey),),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(10)
                  ),

                  suffixIcon: Icon(Icons.visibility_outlined, color: Colors.grey),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2D3C52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>HomePage()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("or continue with", style: TextStyle(color: Colors.grey),),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                icon: Icon(Icons.laptop_chromebook_outlined, color: Colors.grey
                ),
                label: Text("Continue with Google", style: TextStyle(color: Colors.black)),
                onPressed: () {},
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                    side: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                icon: Icon(Icons.facebook, color: Colors.blue),
                label: Text("Continue with Facebook", style: TextStyle(color: Colors.black)),
                onPressed: () {},
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: Text("Register", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
