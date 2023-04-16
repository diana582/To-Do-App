import 'package:flutter/material.dart';
import 'model/todo.dart';
import 'widgets/todo_items.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final todoslist = ToDo.todoList();
List<ToDo> _foundToDo =[];
final _todoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 178, 178),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 250, 208, 81),
        title: Row(
          children: [
            Icon(Icons.menu,color: Colors.black,
            size: 30,),
            Spacer(),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
              ),
            )
          ],
        ),

      ),
      body: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Column(
               children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(8),
                      prefixIcon: Icon(Icons.search,
                      color: Colors.grey,),
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey)
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          child: Text('To-Do List',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
                      for (ToDo todo in todoslist)
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                          ),
                        
                      ),
                      
                         
                         
                         
                         


                        
                      
                    ],
                  ),
                ),
               ], 
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(child: Container(
                  
                  margin: EdgeInsets.only(
                    bottom: 10,
                    left: 20,
                    right: 20,
                  ),
                   padding: EdgeInsets.symmetric(
                   horizontal: 10,
                   vertical: 5,
                   ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 253, 251, 251),
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                  child:TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new ToDo item',
                      border: InputBorder.none,
                    ),
                  ) ,
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20,right: 20),
                  
                  child: ElevatedButton(onPressed: (){
                  _addToDoItem(_todoController.text);

                  }, child: Text('+',style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(60, 60),
                    elevation: 10
                  ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
void _handleToDoChange(ToDo toDo) {
  setState((){
  toDo.isDone = !toDo.isDone;
  });

}
void _deleteToDoItem(String id){
  setState(() {
   todoslist.removeWhere((item) => item.id == id);  
  });
 
}
void _addToDoItem(String todo){
  setState(() {
    todoslist.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), 
    todoText: todo));
  });
  _todoController.clear();
}




}
