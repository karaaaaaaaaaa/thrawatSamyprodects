import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class pointsCounter extends StatefulWidget {
  const pointsCounter({super.key});

  @override
  State<pointsCounter> createState() => _pointsCounterState();
}

class _pointsCounterState extends State<pointsCounter> {
  int count1 = 0;
  int count2 = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber[800],
        title: Text("points Counter"),
        actions: [
          IconButton(
              onPressed: () async {
                http.Response response = await http.post(
                    Uri.parse('https://fakestoreapi.com/products'),
                    body: {
                      'title': 'test product',
                      'price': '13.5',
                      'description': 'lorem ipsum set',
                      'image': 'https://i.pravatar.cc',
                      'category': 'electronic'
                    },headers: {
                      'Content-Type':'application/x-www-form-urlencoded',
                      'Accept':"    application/json"
                    });
                print(response.body);
              },
              icon: Icon(Icons.abc))
        ],
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Column(
              children: [
                Text(
                  "  Team A",
                  style: TextStyle(
                    fontSize: 33,
                  ),
                ),
                Text(
                  " ${count2}",
                  style: TextStyle(
                    fontSize: 150,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.amber[800],
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          count2++;
                        });
                      },
                      child: Text(
                        "Add 1 point ",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.amber[800],
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          count2 += 2;
                        });
                      },
                      child: Text(
                        "Add 2 point ",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.amber[800],
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          count2 += 3;
                        });
                      },
                      child: Text(
                        "Add 3 point ",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(22),
              height: 450,
              width: 1,
              color: Colors.grey,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Team B",
                  style: TextStyle(
                    fontSize: 33,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "${count1}",
                  style: TextStyle(
                    fontSize: 150,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.amber[800],
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          count1++;
                        });
                      },
                      child: Text(
                        "Add 1 point ",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.amber[800],
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          count1 += 2;
                        });
                      },
                      child: Text(
                        "Add 2 point ",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  color: Colors.amber[800],
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          count1 += 3;
                        });
                      },
                      child: Text(
                        "Add 3 point ",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      )),
                ),
              ],
            )
          ]),
          SizedBox(
            height: 33,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22),
            margin: EdgeInsets.all(5),
            color: Colors.amber[800],
            child: TextButton(
                onPressed: () {
                  setState(() {
                    count1 = 0;
                    count2 = 0;
                  });
                },
                child: Text(
                  "Reset ",
                  style: TextStyle(fontSize: 17, color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }
}
