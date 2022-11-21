import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_to_do/models/todo.dart';
import 'package:hive/hive.dart';

class AddToDo extends StatefulWidget {
  const AddToDo({Key? key}) : super(key: key);

  @override
  State<AddToDo> createState() => _AddToDoState();
}

class _AddToDoState extends State<AddToDo> {
  final myController = TextEditingController();
   

    final _mybox = Hive.box<ToDO>('mybox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text(
          "TO DO",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  child: TextField(
                    controller: myController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter your task"),
                    style: TextStyle(fontSize: 20),
                    maxLines: null,
                    minLines: 1,
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  child: Text('SAVE', style: TextStyle(fontSize: 15)),
                  onPressed: () => {
                   _mybox.add(ToDO(todo: myController.text)),
                    Navigator.pop(context)
                  },
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.yellow.shade600),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
