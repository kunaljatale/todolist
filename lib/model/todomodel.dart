class Todo{
  String?id;
  String?todoText;
  bool isDone;
   Todo({
    this.id,this.isDone=false,
    this.todoText
   });
  
   static List<Todo> todolist(){
    return [
   Todo(id: '01', todoText: 'Morning Excercise', isDone: true),
  Todo(id: '02', todoText: 'Buy Groceries', isDone: true),  
   Todo(id: '03', todoText: 'Check Email', ),  
    Todo(id: '04', todoText: 'Team Meeting', ),
  Todo(id: '05', todoText: 'Wwork on mobile apps for 2 hour', ),   
  Todo(id: '06', todoText: 'Dinner with Jenny', ),
    ];
   }

}