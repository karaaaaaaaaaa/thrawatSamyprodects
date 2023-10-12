// ignore_for_file: unused_import

import 'package:app1/noteapp/models/notesmodels.dart';
import 'package:app1/noteapp/noteappCubit/noteappstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';

class noteappCubit extends Cubit<noteappstate> {
  noteappCubit() : super(initalnoteapp());
  static noteappCubit get(context) => BlocProvider.of(context);
  // late Database dataBase;
  //  void createDataBase()  {
  //   openDatabase(
  //     'todo2.db',
  //     version: 1,
  //     onCreate: (database, version) {
  //       print("database has created");
  //       database
  //           .execute(
  //           'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
  //           .then((value) {
  //         print("Table has created");
  //       }).catchError((error) {
  //         print("error is : ${error.toString()}");
  //       });
  //     },
  //     onOpen: (database) {
  //       // getDataFromDataBase(database);
  //       print("database has opened");
  //     },
  //   ).then((value) {
  //     dataBase=value;
  //   emit(TodoCreateDataBaseState());
  //   });
  // }
  //  insertToDataBase(
  //     {required String title,
  //       required String date,
  //       required String time}) async {
  //     await dataBase.transaction((txn) {
  //     return txn.rawInsert(
  //         'INSERT INTO tasks(title, date, time, status) VALUES( "$title", "$date", "$time", "new" )')
  //         .then((value) {
  //       print("$value inserted successfully");
  //       emit(TodoInsertDataBaseState());
  //       // getDataFromDataBase(dataBase);
  //     }).catchError((onError) {
  //       print('The Error while insert is ${onError.toString()}');
  //     });
  //   });
  // }

  // void getDataFromDataBase (dataBase)
  // {
  //   // newTasks=[];
  //   // doneTasks=[];
  //   // archiveTasks=[];
  //   dataBase.rawQuery('SELECT * FROM tasks').then((value) {
  //     value.forEach((element) {
  //       if(element['status']=='new')
  //         newTasks.add(element);
  //       else if(element['status']=='done')
  //         doneTasks.add(element);
  //       else archiveTasks.add(element);
  //       print(element['status']);
  //     });
  //     emit(TodoGetDataBaseState());
  //   });
  // }

  // void updateData({required String status,required int id})
  // {
  //   dataBase.rawUpdate(
  //       'UPDATE tasks SET status = ? WHERE id = ?',
  //       ['$status', id]
  //  ).then((value) {
  //    getDataFromDataBase(dataBase);
  //     emit(TodoUpdateDataBaseState());

  //   });
  // }
  Color color = Color(0xffF5D3C8);
  Addnote(notemodel model) async {
    model.color = color.value;
    emit(TodoCreateDataloadingBaseState());
    var nodesbox = Hive.box<notemodel>("notes_box");
    await nodesbox.add(model).then((value) {
      emit(TodoCreateDatasuccessBaseState());
    }).catchError((error) {
      emit(TodoCreateDataerrorBaseState());
      print(error.toString());
    });
  }

  List<notemodel>? notes;
  fetchAllnotes() {
    var nodesbox = Hive.box<notemodel>("notes_box");
    notes = nodesbox.values.toList();
    emit(TodofetchSuccessState());
  }
}
