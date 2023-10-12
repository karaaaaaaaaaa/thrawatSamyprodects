// ignore_for_file: must_be_immutable, unnecessary_null_comparison

import 'package:app1/egyNews/componets.dart';
import 'package:app1/shopApp/models/productmodel.dart';
import 'package:app1/shopApp/models/updateproduct.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class single_item extends StatefulWidget {
  single_item({super.key, required this.model});

  productmodel? model;
  @override
  State<single_item> createState() => _single_itemState();
}

class _single_itemState extends State<single_item> {
  String? name, image, desc;
  bool isloading = false;
  var price;
late  productmodel model;
  var namecontr = TextEditingController();

  var pricecontr = TextEditingController();

  var imagecontr = TextEditingController();

  var decritioncontr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2B475E),
        appBar: AppBar(
          elevation: 0,
          title: Text("Update Product"),
        ),
        body: ConditionalBuilder(
          condition: !isloading,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    defaultFormText(
                        onSubmit: (value) {
                          name = namecontr.text;
                        },
                        control: namecontr,
                        type: TextInputType.emailAddress,
                        validator: (value) {},
                        label: 'product Name',
                        prefix: Icons.near_me_outlined),
                    SizedBox(
                      height: 22,
                    ),
                    defaultFormText(
                        onSubmit: (value) {
                          image = imagecontr.text;
                        },
                        control: imagecontr,
                        type: TextInputType.emailAddress,
                        validator: (value) {},
                        label: 'product image',
                        prefix: Icons.image),
                    SizedBox(
                      height: 22,
                    ),
                    defaultFormText(
                        onSubmit: (value) {
                          price = pricecontr.text;
                        },
                        control: pricecontr,
                        type: TextInputType.number,
                        validator: (value) {},
                        label: 'product price',
                        prefix: Icons.monetization_on),
                    SizedBox(
                      height: 22,
                    ),
                    defaultFormText(
                        onSubmit: (value) {
                          desc = decritioncontr.text;
                        },
                        control: decritioncontr,
                        type: TextInputType.emailAddress,
                        validator: (value) {},
                        label: 'product Description',
                        prefix: Icons.near_me_outlined),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(blurRadius: 22, color: Colors.grey)
                      ]),

                      child: defaultButton(
                          backGroundColor: Colors.black,
                          onTap: () {
                            isloading = true;
                            setState(() {});
                            try {
                              updatedata(model);
                              print("success");
                            } catch (error) {
                              print(error.toString());
                            }
                            setState(() {});
                            isloading = false;
                          },
                          text: "Update",
                          radius: 11),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }

  void updatedata(productmodel model) {
    Updateproducts().updateproduct(
      title: namecontr.text == null ? model.title : namecontr.text,
      price: pricecontr.text == null ? model.price : pricecontr.text,
      image: imagecontr.text == null ? model.image : imagecontr.text,
      description:
          decritioncontr.text == null ? model.description : decritioncontr.text,
      category: model.category,
    );
  }
}
