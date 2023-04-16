import 'package:flutter/material.dart';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false
  });
  static Set<ToDo> todoList() {
    return{
  //  ToDo(id: '01',todoText: 'Make biriyani',isDone: true),
  //  ToDo(id: '02',todoText: 'Buy Groceries',isDone: true),
   ToDo(id: '03',todoText: 'Meet Hari'),
   ToDo(id: '04',todoText: 'Interview'),
  //  ToDo(id: '05',todoText: 'Call Sonu'),
  // ToDo(id: '06',todoText: 'Go shopping',isDone: true),
    ToDo(id: '07',todoText: 'Make noodles',isDone: true),
  //  ToDo(id: '08',todoText: 'Help mama',isDone: true),





    };
  }
}