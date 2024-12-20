import 'package:flutter/material.dart';
import 'package:foodreciepe/controller/functions.dart';

class Listpage extends StatefulWidget {
  const Listpage({super.key});

  @override
  State<Listpage> createState() => _ListpageState();
}

class _ListpageState extends State<Listpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: notifeir,
        builder: (context, value, child) {
          if (value.isEmpty) {
            return Center(child: Text("no data"));
          }
          return ListView.builder(
            itemCount: value.length,
            itemBuilder: (context, index) {
              final data = value[index];
              return ListTile(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.receipename?? 'null value',
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 1)),
                    Text(data.description ?? 'null value')
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                   
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        print("data deleted");
                        delete(index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    
    );
  }
}