import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/api/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: ListView.builder(
          itemCount: todoP.todoss.length,
          itemExtent: 60.0,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(todoP.todoss[index].title),
              subtitle: Text(todoP.todoss[index].description),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {fetchTasks},
      ),
    );
  }
}

fetchTasks() async {
  final url = 'http://192.168.0.157:8000/api/v4/';
  final response = await http.get(url);
  print(response.statusCode);
  // if (response.statusCode == 200) {
  //   print(response.body);
  //   var data = json.decode(response.body) as List;
  //   var todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
  // }
  print("hi");
}
