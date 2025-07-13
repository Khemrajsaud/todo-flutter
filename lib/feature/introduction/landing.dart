
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,

      width: double.infinity,
      height: double.infinity,
      child: Center(
         child:Column(
        
        children:[
         Image.asset(
          'assets/images/landing.png',
          width: 300,
          fit: BoxFit.contain,
        ),

        const Text(
          'welcome to flutter app',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        ]
        
         ),
      ),
    );
  }
}
