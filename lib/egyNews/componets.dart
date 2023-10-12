import 'package:app1/egyNews/webview/web_view.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color backGroundColor = Colors.blue,
  Color TextColor = Colors.white,
  bool isUpperCase = true,
  double radius = 0.0,
  required void Function() onTap,
  required String text,
}) =>
    Container(
        width: width,
        decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.circular(radius)),
        child: MaterialButton(
          onPressed: onTap,
          child: Text(
            isUpperCase ? text.toUpperCase() : text,
            style: TextStyle(
                fontSize: 20, color:TextColor , fontWeight: FontWeight.bold),
          ),
        ));

Widget defaultFormText({
  required TextEditingController control,
  required TextInputType type,
  required dynamic validator,
  Function? onSubmit,
  Function? onChanged,
  Function? onTap,
  bool isPassword = false,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixClicked,
}) =>
    TextFormField(
      controller: control,
      keyboardType: type,
      validator: validator,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onTap: () {
        onTap!();
      },
      obscureText: isPassword,
      onChanged: (value) {
        onChanged!(value);
      },
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        prefixIconColor: Colors.white,
        suffixIconColor:Colors.white,
          labelText: label,
          prefixIcon: Icon(prefix),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixClicked!();
                  },
                  icon: Icon(suffix),
                )
              : null,
          border: OutlineInputBorder(),),
    );
void navigateTo(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}

void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) => false);


Widget artical(aratical, context) => InkWell(
      onTap: () => navigateTo(context, WebViewScreen(url: aratical['url'])),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                aratical['image'] != null
                        ?
                Image.network(
                  
                  "${aratical['image']}",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ):
                Image.network(
                   width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png')
                
                ,
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    child: Column(
                      children: [
                        Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          "${aratical['title']}",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "${aratical['publishedAt']}",
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
Widget listartical(buslist, context, {required int listcount, }) =>
    ConditionalBuilder(
      condition: buslist.length > 0,
      builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => artical(buslist[index], context),
          separatorBuilder: (context, index) =>  Container(
            height: 1,
            width: double.infinity,
            color: Colors.grey,
          ),
          itemCount: listcount),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );