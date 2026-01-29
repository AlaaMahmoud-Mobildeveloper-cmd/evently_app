import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/firebase_functions.dart';
import 'package:evently_app/models/task_model.dart';
import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  List<String> categories = [
    "All",
    "Birthday",
    "Sport",
    "Book Club",
    "Exhibition",
    "Meeting"
  ];
  List<TaskModel> tasks = [];
  int selectedCategory = 0;
  StreamSubscription<QuerySnapshot<TaskModel>>? _taskStream;

  changeSelectCategory(int index) {
    selectedCategory = index;
    getTasksStream();
    notifyListeners();
  }


  getTasksStream(){
    _taskStream?.cancel();
    _taskStream = FirebaseFunction.getTasksStream(
      categories: selectedCategory == 0
          ? null
          : categories[selectedCategory],
    ).listen((event) {
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
@override
  void dispose() {
  _taskStream?.cancel();
  super.dispose();

}

}