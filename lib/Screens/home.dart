import 'package:flutter/material.dart';
import 'package:todo_app/Constant/colors.dart';
import 'package:todo_app/model/todomodel.dart';
import 'package:todo_app/widget/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _FirstPageState();
}

class _FirstPageState extends State<HomePage> {
  final todosList = Todo.todolist();
  List<Todo>_foundToDo=[];
  final _todoController = TextEditingController();

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  @override
  void initState() {
    _foundToDo=todosList;
    // TODO: implement initState
    super.initState();
  }

 void _runFilter (String enteredkeyword){
List<Todo> result=[];
 if(enteredkeyword.isEmpty){
  result=todosList;
 }else{
  result= todosList.where((item)=>item.todoText!.toLowerCase().contains(enteredkeyword.toLowerCase())).toList();
 }
 setState(() {
   _foundToDo=result;
 });

 }


  void _deleteTodoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String todo) {
    setState(() {
      todosList.add(
  Todo(id: DateTime.now().millisecondsSinceEpoch.toString(),  todoText:todo  ));
    });
        _todoController.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                          margin: EdgeInsets.only(top: 50, bottom: 20),
                          child: Text(
                            "All ToDos",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )),
                      for (Todo todoo in _foundToDo)
                        TodoItem(
                          todo: todoo,
                          onToDoChanged: _handleTodoChange,
                          onDeleteItem: _deleteTodoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 10,
                            spreadRadius: 0.0),
                      ],
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: "Add a new todo item",
                      border: InputBorder.none,
                    ),
                  ),
                )),
                Container(
                  margin: EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      "+",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: tdBlue,
                        minimumSize: Size(60, 60),
                        elevation: 10),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: tdBGColor,
    leading: CircleAvatar(
      // minRadius: 50,
      // maxRadius: 10,

      backgroundColor: Color.fromARGB(255, 8, 117, 136),
    ),
    actions: [
      Icon(
        Icons.dehaze,
        size: 40,
        weight: 30,
      ),
      SizedBox(
        width: 30,
      )
    ],
  );
}

Widget searchBox() {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(20)),
    //  const EdgeInsets.symmetric(horizontal: 10),

    child: TextField(

  //  onChanged: (value) => _runFilter(value))

      // onChanged: (value) => _runFilter(value)),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search here",
          hintStyle: TextStyle(color: tdGrey),
          contentPadding: EdgeInsets.all(0),
          prefixIcon:

              //  const EdgeInsets.fromLTRB(0, 0, 6, 4),
              Icon(
            Icons.search,
            color: tdBlack,
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25)),
    ),
  );
}
