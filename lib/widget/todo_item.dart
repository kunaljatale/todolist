import 'package:flutter/material.dart';
import 'package:todo_app/Constant/colors.dart';
import 'package:todo_app/model/todomodel.dart';

class TodoItem extends StatelessWidget {

  const TodoItem({super.key,required this.todo,required this.onDeleteItem, required this.onToDoChanged});
  final Todo todo;
  final onToDoChanged;
  final onDeleteItem;
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
        
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)
         ),
         contentPadding: EdgeInsets.symmetric(horizontal:20,vertical: 7 ),
         tileColor:Colors.white,
         leading:  Icon(
          
         todo.isDone? Icons.check_box:Icons.check_box_outline_blank,
         
         color: tdBlue,),
         title: 
         
         Text( todo.todoText!
          
          ,style: TextStyle(fontSize: 16,color: tdBlack,decoration:   todo.isDone?  TextDecoration.lineThrough:null ),
         ),
         trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical:12 ),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
          color: tdRed,
          borderRadius: BorderRadius.circular(5)

          ),
          child: IconButton(onPressed:(){
        

          onDeleteItem(todo.id);

          }, icon: 
          Icon(Icons.delete), 
          iconSize:13 ,color: Colors.white,),
         ) ,
      ),
    );
  }
}