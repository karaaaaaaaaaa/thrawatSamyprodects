// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class businesscord extends StatelessWidget {
  // const businesscord({super.key});
  var phonecontrol = TextEditingController();
  var scalercontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B475E),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/img/1.jpg',
              ),
              radius: 100,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "kareem Alfara",
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontFamily: "Pacifico"),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "flutter developer",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(22)),
            // padding: EdgeInsets.all(11),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: phonecontrol,
              decoration: InputDecoration(
                  
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.phone,color: Color(0xFF2B475E),),
                  label: Container(
                      margin: EdgeInsets.only(left: 30), child: Text('phone'))),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(22)),
            // padding: EdgeInsets.all(11),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: scalercontrol,
              decoration: InputDecoration(
                
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.email,color: Color(0xFF2B475E),),
                  label: Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text('kareemelfara@gmail.com'))),
            ),
          ),
        ],
      )),
    );
  }
}
