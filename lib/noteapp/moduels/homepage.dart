// ignore_for_file: must_be_immutable, non_constant_identifier_names, prefer_const_constructors

import 'package:app1/egyNews/componets.dart';
import 'package:app1/noteapp/models/notesmodels.dart';
import 'package:app1/noteapp/moduels/editnotes.dart';
import 'package:app1/noteapp/noteappCubit/noteappCubit.dart';
import 'package:app1/noteapp/noteappCubit/noteappstate.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Noteshomepage extends StatefulWidget {
  @override
  State<Noteshomepage> createState() => _NoteshomepageState();
}

class _NoteshomepageState extends State<Noteshomepage> {
  // const Noteshomepage({super.key});
  var titlecontrol = TextEditingController();

  var Contentcontrol = TextEditingController();

  var formkey = GlobalKey<FormState>();
  @override
  void initState() {
    noteappCubit.get(context).fetchAllnotes();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<noteappCubit, noteappstate>(
      builder: (context, state) {
        List<notemodel> notes = noteappCubit.get(context).notes!;
        return Scaffold(
          backgroundColor: Color(0xff312F31),
          appBar: AppBar(
            backgroundColor: Color(0xff312F31),
            elevation: 0,
            title: Text(
              "Notes",
              style: TextStyle(fontSize: 25),
            ),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 13),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    notesbody(context, notes[index]),
                separatorBuilder: (context, index) => SizedBox(
                      height: 1,
                    ),
                itemCount: notes.length),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xff53EBD4),
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Color(0xff312F31),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                context: context,
                builder: (context) => bottomsheet(context),
              );
            },
            child: Icon(
              Icons.add,
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget bottomsheet(context) => BlocConsumer<noteappCubit, noteappstate>(
        builder: (context, state) => Container(
          child: Padding(
            padding: EdgeInsets.only(
                top: 8.0,
                left: 8,
                right: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "title is Empty";
                        } else {
                          return null;
                        }
                      },
                      controller: titlecontrol,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        label: Container(
                          child: Text(
                            "Title",
                            style: TextStyle(
                                color: Color(0xff53EBD4), fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return " Content is Empty";
                        } else {
                          return null;
                        }
                      },
                      controller: Contentcontrol,
                      maxLines: 6,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                        label: Container(
                          child: Text(
                            "Content",
                            style: TextStyle(
                                color: Color(0xff53EBD4), fontSize: 22),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Colorlist(),
                    SizedBox(
                      height: 10,
                    ),
                    ConditionalBuilder(
                      condition: State is! TodoCreateDataloadingBaseState,
                      builder: (context) => defaultButton(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              var nn = DateFormat.yMd().format(DateTime.now());
                              var model = notemodel(
                                  title: titlecontrol.text,
                                  subtitle: Contentcontrol.text,
                                  date: nn,
                                  color: Colors.blue.value);
                              noteappCubit.get(context).Addnote(model);
                            }
                          },
                          text: "Add",
                          TextColor: Colors.black,
                          backGroundColor: Color(
                            0xff53EBD4,
                          ),
                          isUpperCase: false,
                          radius: 12),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        listener: (context, state) {
          if (state is TodoCreateDatasuccessBaseState) {
            noteappCubit.get(context).fetchAllnotes();
            Navigator.pop(context);
          }
        },
      );

  Widget notesbody(context, notemodel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(children: [
        SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () => navigateTo(
              context,
              editNotes(
                model: model,
              )),
          child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(model.color),
                borderRadius: BorderRadius.circular(11),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 22,
                  ),
                  ListTile(
                    title: Text(
                      "${model.title}",
                      style: TextStyle(fontSize: 25),
                    ),
                    subtitle: Text(
                      model.subtitle,
                      style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        model.delete();
                        noteappCubit.get(context).fetchAllnotes();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    model.date,
                    style: TextStyle(fontSize: 19, color: Colors.grey[500]),
                  )
                ],
              )),
        )
      ]),
    );
  }
}

Widget Coloritem(bool? isActive, Color? color) {
  return isActive!
      ? CircleAvatar(
          radius: 43,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: color,
          ),
        )
      : CircleAvatar(
          radius: 36,
          backgroundColor: color,
        );
}

class Colorlist extends StatefulWidget {
  const Colorlist({super.key});

  @override
  State<Colorlist> createState() => _ColorlistState();
}

class _ColorlistState extends State<Colorlist> {
  int currentidex = 0;
  List<Color> colors = [
    Color(0xffF5D3C8),
    Color(0xffCBFF8C),
    Color(0xffFE9000),
    Color(0xff5ADBFF),
    Color(0xff8A8D91),
    Color(0xff3C6997),
    Color(0xff094074),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2 + 1,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    currentidex = index;
                    noteappCubit.get(context).color = colors[index];
                  });
                  print(index);
                },
                child: Coloritem(currentidex == index, colors[index]));
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 11,
              ),
          itemCount: colors.length),
    );
  }
}
