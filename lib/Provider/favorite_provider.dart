import 'package:evently_app/core/firebase_functions.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier{
  List<TaskModel> tasks = [];
  getFavoriteTasks(){
    FirebaseFunction.getFavoriteStream().listen((event) {
      tasks = event.docs.map((e) => e.data()).toList();
      notifyListeners();
    });
  }

  updateTask(TaskModel task) async{
    await FirebaseFunction.updateTask(task);
  }

  deleteTask(TaskModel task) async{
    await FirebaseFunction.deleteTask(task);
  }
}