import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class TodoProvider with ChangeNotifier {
  TodoProvider() {
    this.fetchTasks();
  }

  List<Todo> _todos = [];

  List<Todo> get todoss {
    return [..._todos];
  }

  fetchTasks() async {
    final url = 'http://192.168.0.157:8000/api/v4/';
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body) as List;
      _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
    }
    print("hi");
  }
}
