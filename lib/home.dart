import 'package:flutter/material.dart';
import 'package:todoapp/Utli/BoxDilog.dart';
import 'package:todoapp/Utli/my_button.dart';
import 'package:todoapp/Utli/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomeState();
}

class _MyHomeState extends State<HomePage> {

  final _controller =TextEditingController();

  List ToDoList=[

  ];
  void changeCheckBox(bool? value,int index)
  {
    setState(() {
      ToDoList[index][1]=!ToDoList[index][1];
    });

  }
  // save new task
  void saveNewTask()
  {
    setState(() {
        if(_controller.text!='')
      ToDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // delete task

  void deletTask(int indx)
  {
    setState(() {
      ToDoList.removeAt(indx);
    });

  }

  void alertD() {


    showDialog(context: context,
        builder:(BuildContext ctx){
          return MyDilog(
            controller: _controller,
            onSave: saveNewTask ,
            onCancel:  ()=>Navigator.of(context).pop(),
          );
        } ,barrierDismissible: true ); // barrierDismissible --> فصل الديلوج بالضغط غي اي بمكان
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(
          child: Text('To Do',style: TextStyle(
            fontSize: 30,
          ),),
        ),
        elevation: 0,

      ),
      floatingActionButton:  FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>alertD(),
      ),
      body: ListView.builder(
        itemCount: ToDoList.length,
          itemBuilder: (context,index){
          return ToDoTile(
              taskName: ToDoList[index][0],
              taskCompleted: ToDoList[index][1],
              onChanged:(value)=>changeCheckBox(value, index),
              deleteFunction :(context)=> deletTask(index),
          );

          }

      ),

    );
  }
}
