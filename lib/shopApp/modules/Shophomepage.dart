import 'package:app1/egyNews/componets.dart';
import 'package:app1/shopApp/models/getallproduct.dart';
import 'package:app1/shopApp/models/productmodel.dart';
import 'package:app1/shopApp/modules/single_item.dart';
import 'package:flutter/material.dart';

class Shophomepage extends StatelessWidget {
  const Shophomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
          ],
          backgroundColor: Colors.white,
          title: Text(
            "New Trend",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<productmodel>>(
            future: allproduct().getallproducts(),
            builder: (context, snapshot) {
              // print(snapshot.data);

              // print(snapshot.data?[0].id);

              if (snapshot.hasData) {
                List<productmodel> prolist = snapshot.data!;
                print("${snapshot.data?[0].category}category");
                return Padding(
                  padding: const EdgeInsets.only(top: 22),
                  child: GridView.builder(
                    clipBehavior: Clip.none,
                    itemCount: prolist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) =>
                        defultCard(prolist[index], context),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }

  Widget defultCard(productmodel model, context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            print(model.id);
            navigateTo(context, single_item(model: model,));
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 50,
                      spreadRadius: 20,
                      color: Colors.grey.withOpacity(0.1),
                      offset: Offset(1, 1)),
                ]),
                height: 160,
                // width: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("${model.title.substring(0, 12)}",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey)),
                          Row(
                            children: [
                              Text(
                                r'$' " ${model.price}",
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 56,
                  top: -30,
                  child: Image.network(
                    "${model.image}",
                    // "https://freepngimg.com/thumb/categories/627.png",
                    height: 100,
                    width: 100,
                  ))
            ],
          ),
        ),
      );
}
