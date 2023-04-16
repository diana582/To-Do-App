import 'package:flutter/material.dart';

import '../model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
   ToDoItem({super.key, required this.todo,required this.onDeleteItem,required this.onToDoChanged});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: ListTile(
        onTap: (){
         onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          
        ),
        tileColor: Color.fromARGB(255, 240, 200, 80),
        leading: Icon(
          todo.isDone ?Icons.check_box: Icons.check_box_outline_blank,color: Colors.black,),
        title: Text(todo.todoText!,
        
        style: TextStyle(
          decoration: todo.isDone? TextDecoration.lineThrough : null,
          fontSize: 16,
          color: Colors.black
        ),
        ),
        
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
            
          ),
          child: IconButton(
            onPressed: (){
            onDeleteItem(todo.id);
            },
            color: Colors.white,
            icon: Icon(Icons.delete),
            iconSize: 18,),
        ),
      ),
    );
  }
}