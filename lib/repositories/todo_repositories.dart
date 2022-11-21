import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tudo_list/models/todo.dart';

const keyTodo ='todo_list';
class TodoRepository{
  
  late SharedPreferences sharedPreferences;
  Future<List<Todo>> getTodoList() async{
    sharedPreferences = await SharedPreferences.getInstance();
    final String jsonString = sharedPreferences.getString(keyTodo) ?? '[]';
    final  List jsonDecode = json.decode(jsonString) as List;  
    return jsonDecode.map((e) => Todo.fromJson(e)).toList();
  }
  void saveTodoList(List<Todo> todos){
    final jsonString = json.encode(todos);
    sharedPreferences.setString(keyTodo, jsonString);
  } 

  
}