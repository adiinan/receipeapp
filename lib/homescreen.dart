import 'package:flutter/material.dart';
import 'package:foodreciepe/controller/functions.dart';
import 'package:foodreciepe/listpage.dart';
import 'package:foodreciepe/modal/recipe.dart';
import 'package:gap/gap.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  TextEditingController titleCrtl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      backgroundColor: Colors.red,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          TextField(
                            controller: titleCrtl,
                            decoration: InputDecoration(
                                label: Text("Recipename:"),
                                border: OutlineInputBorder()),
                          ),
                          Gap(7),
                          TextField(
                            maxLines: 6,
                            controller: descriptionCtrl,
                            decoration: InputDecoration(
                                label: Text("description..."),
                                border: OutlineInputBorder()),
                          ),
                          Gap(6),
                          ElevatedButton(
                              onPressed: () {
                                addDataBtn();
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.black),
                              )),
                        ],
                      ),
                    ),
                  );
                });
          }),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Listpage()));
            },
            child: Text(
              "view food and its receipes ",
              style: TextStyle(color: Colors.black, fontSize: 10),
            )),
      ),
    );
  }

  void addDataBtn() {
    Recipe data =
        Recipe(receipename: titleCrtl.text, description: descriptionCtrl.text);
    addData(data);
    Navigator.pop(context);
    titleCrtl.clear();
    descriptionCtrl.clear();
  }
}
