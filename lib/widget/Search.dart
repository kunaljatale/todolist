import 'package:flutter/material.dart';
import 'package:todo_app/Constant/colors.dart';
import 'package:todo_app/model/todomodel.dart';

class Search_bar extends StatefulWidget {
  const Search_bar({super.key});

  @override
  State<Search_bar> createState() => _Search_barState();
}

class _Search_barState extends State<Search_bar> {
  final todosList = Todo.todolist();
  List<Todo>_foundToDo=[];
  final _todoController = TextEditingController();

   
     void   Search_action(String enteredkey) {
List<Todo> results=[];
 if(enteredkey.isEmpty){
results=todosList;

 }else{
  results=todosList.where((item)=>item.todoText!.toLowerCase().contains(enteredkey.toLowerCase())).toList();
    
 }
 setState(() {
   _foundToDo=results;
 });

}



  @override
  Widget build(BuildContext context) {
    return   Scaffold(
    
    );

  
}


}