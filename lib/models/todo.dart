import 'package:flutter/cupertino.dart';

class Todo{

  Todo({required this.title, required this.dateTime});
  Todo.fromJson( Map<String, dynamic> json) :
   title = json['title'],   dateTime =  DateTime.parse(json['dateTime']);
 final String title;
 final DateTime dateTime; 

 Map<String, dynamic>toJson(){
    return{
      'title':title,
      'dateTime': dateTime.toIso8601String()
    };
  }
} 