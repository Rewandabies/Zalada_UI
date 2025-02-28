import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile_pic.png'),
                  ),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.edit, color: Colors.white, size: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            _buildLabel("Fullname"),
            _buildTextField(initialValue: "Bryan Adam"),
            _buildLabel("Date of Birth"),
            _buildTextField(initialValue: "12/12/1994", icon: Icons.calendar_today),
            _buildLabel("Email Address"),
            _buildTextField(initialValue: "bryan.adam83@gmail.com"),
            _buildLabel("Phone Number"),
            _buildPhoneField(),
            _buildLabel("Gender"),
            _buildTextField(initialValue: "female", icon: Icons.arrow_drop_down),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2D3C52),
                  minimumSize: Size(335, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Text("Save Change", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0, top: 16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,color: Colors.grey),
      ),
    );
  }

  Widget _buildTextField({String? initialValue, IconData? icon}) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8),),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)), 
          ),



        suffixIcon: icon != null ? Icon(icon) : null,),

      controller: TextEditingController(text: initialValue),
    );
  }

  Widget _buildPhoneField() {
    return Row(
      children: [
        Container(
          width: 60,
          padding: EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(8),
            
          ),
          child: Center(child: Text("+62", style: TextStyle(fontSize: 16))),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)), 
    ),
    
            ),
            controller: TextEditingController(text: "812 788 611672"),
          ),
        ),
      ],
    );
  }

  // Widget _buildDropdownField() {
  //   return DropdownButtonFormField(
  //     decoration: InputDecoration(
  //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
  //     ),
  //     items: ["Male", "Female"].map((String category) {
  //       return DropdownMenuItem(value: category, child: Text(category));
  //     }).toList(),
  //     onChanged: (value) {},
  //     value: "Male",
  //   );
  // }
}
