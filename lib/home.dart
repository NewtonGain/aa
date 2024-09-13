import 'package:aa/db.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool suggest = false;
  bool Personal = true, College = false, Office = false;
  TextEditingController todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent.shade100,
        onPressed: () {
          openBox();
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white38,
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          children: [
            Container(
              child: const Text(
                "Hey",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: const Text(
                "Newton",
                style: TextStyle(fontSize: 60, color: Colors.black),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: const Text(
                "Lets start",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Personal
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Personal",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Personal = true;
                          College = false;
                          Office = false;
                          setState(() {});
                        },
                        child: Text(
                          'Personal',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                College
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "College",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Personal = false;
                          College = true;
                          Office = false;
                          setState(() {});
                        },
                        child: Text(
                          'College',
                          style: TextStyle(fontSize: 20),
                        )),
                Office
                    ? Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade200,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "Office",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Personal = false;
                          College = false;
                          Office = true;
                          setState(() {});
                        },
                        child: Text(
                          'Office',
                          style: TextStyle(fontSize: 20),
                        )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CheckboxListTile(
              activeColor: Colors.greenAccent.shade100,
              title: Text('helo'),
              value: suggest,
              onChanged: (newValue) {
                setState(() {
                  suggest = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              activeColor: Colors.greenAccent.shade100,
              title: Text('helo'),
              value: suggest,
              onChanged: (newValue) {
                setState(() {
                  suggest = newValue!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ],
        ),
      ),
    );
  }

  openBox() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.cancel),
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  "Add To do task",
                  style: TextStyle(color: Colors.greenAccent.shade400),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text("Add Text"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2.0)),
                  child: TextField(
                    controller: todoController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Enter the task"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        String id = randomAlphaNumeric(10);
                        Map<String, dynamic> userTodo = {
                          "work": todoController.text,
                          "id": id,
                        };
                        Personal
                            ? DatabaseService().addPersonalTask(userTodo, id)
                            : College
                                ? DatabaseService().addCollegeTask(userTodo, id)
                                : Office
                                    ? DatabaseService()
                                        .addOfficeTask(userTodo, id)
                                    : Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
