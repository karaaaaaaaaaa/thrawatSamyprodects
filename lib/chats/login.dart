// ignore_for_file: must_be_immutable

import 'package:app1/chats/layout.dart';
import 'package:app1/chats/loginCubit/logincubit.dart';
import 'package:app1/chats/loginCubit/loginstate.dart';
import 'package:app1/chats/register.dart';
import 'package:app1/egyNews/componets.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatLogin extends StatelessWidget {
  // const ChatLogin({super.key});
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => chatlogincubit(),
      child: BlocConsumer<chatlogincubit, chatloginstate>(
        builder: (context, state) {
          var cubit = chatlogincubit.get(context);

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
                      Text("Sign In",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormText(
                          control: emailcontroller,
                          onSubmit: (value) {
                            // cubit.getloginDate(
                            //     password: passwordcontroller.text,
                            //     emailAddress: emailcontroller.text);
                          },
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
                          isPassword:
                          
                                    chatlogincubit.get(context).isPassword,
                                label: 'Password',
                                prefix: Icons.lock,
                                suffix: chatlogincubit.get(context).suffix,
                                suffixClicked: () {
                                  chatlogincubit
                                      .get(context)
                                      .changePasswordVisibility();
                                },
                          onSubmit: (value) {
                            if (formkey.currentState!.validate()) {
                              cubit.getloginDate(
                                  password: passwordcontroller.text,
                                  emailAddress: emailcontroller.text);
                            }
                          },
                          control: passwordcontroller,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'password Can not be Empty';
                            }else
                            return null;
                          },
                          // label: 'password',
                          // prefix: Icons.lock
                          ),
                      SizedBox(
                        height: 30,
                      ),
                   ConditionalBuilder(condition:state is! loginloadingstate, 
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
                          text: 'Sign In'), fallback:(context) => Center(child: CircularProgressIndicator(),),)
                     , SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                              child: Text("don't have an account ",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400))),
                          TextButton(
                              onPressed: () {
                                navigateAndFinish(context, register());
                              },
                              child: Text("Sign Up",
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
          if (state is loginSucessstate) {
              ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Center(child: Text("login Success",style: TextStyle(color: Colors.white),))));
            navigateAndFinish(context, chatlayout(email: emailcontroller.text,));

          } else if (state is loginErrorstate) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("${state.error.toString()} ,please try again",style: TextStyle(color: Colors.white),)));
          }
        },
      ),
    );
  }
}
