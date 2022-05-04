import 'dart:convert';

import 'package:get/get.dart';
import 'package:taskmanager/Helper/Keys.dart';
import 'package:taskmanager/Model/task.dart';
import 'package:taskmanager/Services/Service.dart';

class TaskProvider {
  StorageService _storage = Get.find<StorageService>();

  List<Task> readTask(){
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks){
    _storage.write(taskKey, jsonEncode(tasks));
  }

}