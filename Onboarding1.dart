import 'package:final_project/features/presentation/Onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/widgets/onboardingWidget.dart';
void main() {
  runApp(Onboarding1());
}
class Onboarding1 extends StatelessWidget {
  OnboardingWidget firstOne = OnboardingWidget( title: """Find the item you've
been looking for""", description: """Here you'll see a variety of goods carefully classified for seamless browsing experience.""");
   Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       actions: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("skip", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
         )
       ],
     ),
      body:Column(
        children: [
          SvgPicture.asset("assets/images/im2.svg"),
          Center(
            child: firstOne,
          ),
          SizedBox(
            height: 30,
          ),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding2()));
          }, icon: Stack(children:[
            SizedBox(
              height: 94,
              width: 94,
              child: CircularProgressIndicator(

                value: 0.5,
                strokeWidth: 3,
                color: Color(0xFF2D3C52),
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(Icons.arrow_forward, size: 50,color: Color(0xFF2D3C52)),
            ),

          ],),),
        ],
      ),

    );
  }
}
