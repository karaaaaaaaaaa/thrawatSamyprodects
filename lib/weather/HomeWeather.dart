
import 'package:app1/egyNews/componets.dart';
import 'package:app1/weather/search.dart';
import 'package:flutter/material.dart';

class weatherhome extends StatelessWidget {
  const weatherhome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            // backgroundColor: Colors.black,
            elevation: 0,
            title: Text("Weather App "),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, search());
                  },
                  icon: Icon(Icons.search))
            ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "there is no weather 😔 start",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
