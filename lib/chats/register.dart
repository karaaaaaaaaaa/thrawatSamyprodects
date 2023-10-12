// ignore_for_file: must_be_immutable

import 'package:app1/chats/layout.dart';
import 'package:app1/chats/login.dart';
import 'package:app1/chats/registerCubit/registercubit.dart';
import 'package:app1/chats/registerCubit/registerstate.dart';

import 'package:app1/egyNews/componets.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class register extends StatelessWidget {
  // const register({super.key});
  var passwordcontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => chatregistercubit(),
      child: BlocConsumer<chatregistercubit, chatregisterstate>(
        builder: (context, state) {
          var cubit = chatregistercubit.get(context);
          return Scaffold(
            backgroundColor: Color(0xff2B475E),
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: CircleAvatar(
                          radius: 44,
                          backgroundImage: AssetImage(
                              "assets/images/family_members/family_older_brother.png"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                        "Scholar Chat",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Pacifico'),
                      )),
                      SizedBox(
                        height: 50,
                      ),
                      Text("Sign Up",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormText(
                          control: emailcontroller,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email Can not be Empty';
                            }
                            return null;
                          },
                          label: 'Email',
                          prefix: Icons.email),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormText(
                          control: passwordcontroller,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'password Can not be Empty';
                            }
                            return null;
                          },
                          label: 'password',
                          prefix: Icons.lock),
                      SizedBox(
                        height: 30,
                      ),
                        ConditionalBuilder(condition:state is! registerloadingstate, 
                   builder:(context) =>    defaultButton(
                          TextColor: Color(0xff2B475E),
                          radius: 10,
                          backGroundColor: Colors.white,
                          onTap: () {
                              if (formkey.currentState!.validate()) {
                              cubit.getloginDate(
                                  password: passwordcontroller.text,
                                  emailAddress: emailcontroller.text);
                            }
                          },
                          text: 'Register'), fallback:(context) => Center(child: CircularProgressIndicator(),),)
                     ,
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text("I already have an account ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))),
                          TextButton(
                              onPressed: () {
                                navigateAndFinish(context, ChatLogin());
                              },
                              child: Text("Log in",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400)))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )),
          );
        },
        listener: (context, state) {
           if (state is registerSucessstate) {
              ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Center(child: Text("register Success",style: TextStyle(color: Colors.white),))));
            navigateAndFinish(context, chatlayout(email: emailcontroller.text,));

          } else if (state is registerErrorstate) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("${state.error.toString()} ,please try again",style: TextStyle(color: Colors.white),)));
          }
        },
      ),
    );
  }
}
