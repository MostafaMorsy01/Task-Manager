

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controller/controller.dart';
import 'package:taskmanager/Model/task.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     return Container();
   }
 }
 