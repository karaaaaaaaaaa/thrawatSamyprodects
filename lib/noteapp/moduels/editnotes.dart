// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers

import 'package:app1/noteapp/models/notesmodels.dart';
import 'package:app1/noteapp/noteappCubit/noteappCubit.dart';
import 'package:app1/noteapp/noteappCubit/noteappstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class editNotes extends StatefulWidget {
  const editNotes({super.key, required this.model});
  final notemodel model;

  @override
  State<editNotes> createState() => _editNotesState();
}

class _editNotesState extends State<editNotes> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<noteappCubit, noteappstate>(
      builder: (context, state) => Scaffold(
        backgroundColor: Color(0xff312F31),
        appBar: AppBar(
          backgroundColor: Color(0xff312F31),
          elevation: 0,
          title: Text(
            "Edit Notes",
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  widget.model.title = title ?? widget.model.title;
                  widget.model.subtitle = content ?? widget.model.subtitle;
                  widget.model.save();
                  noteappCubit.get(context).fetchAllnotes();

                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.check,
                  size: 25,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              TextFormField(
                onChanged: (value) {
                  title = value;
                },
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
                      widget.model.title,
                      style: TextStyle(color: Color(0xff53EBD4), fontSize: 22),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                onChanged: (value) {
                  content = value;
                },
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
                      widget.model.subtitle,
                      style: TextStyle(color: Color(0xff53EBD4), fontSize: 22),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
      listener: (context, state) {},
    );
  }
}
