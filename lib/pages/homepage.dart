import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_to_do/models/todo.dart';
import 'package:flutter_to_do/pages/addtodo.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool value = false;

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box<ToDO>('mybox');
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

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
        floatingActionButton: FloatingActionButton(
          onPressed: (() async {
            await Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddToDo()));

            setState(() {});
          }),
          backgroundColor: Colors.yellow[600],
          child: Icon(Icons.add),
        ),
        body: ValueListenableBuilder<Box<ToDO>>(
            valueListenable: Hive.box<ToDO>("mybox").listenable(),
            builder: (context, box, _) {
              final todos = box.values.toList().cast<ToDO>();
              return buildContent(todos);
            }));
  }

  Widget buildContent(List toDoList) {
    return ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          ToDO item = toDoList[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Slidable(
              key: UniqueKey(),
              endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {
                    setState(() {
                      _mybox.deleteAt(index);
                    });
                  }),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ]),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Row(
                    children: [
                      Checkbox(
                          value: item.isCompleted,
                          onChanged: (exp) {
                            setState(() {
                               item.isCompleted = exp!;
                              _mybox.putAt(index, item);
                              print(value);
                            });
                          }),
                      Text(
                        item.todo,
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
