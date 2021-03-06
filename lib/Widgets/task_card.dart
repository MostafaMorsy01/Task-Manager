

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:taskmanager/Controller/controller.dart';
import 'package:taskmanager/Helper/extensions.dart';
import 'package:taskmanager/Model/task.dart';
import 'package:taskmanager/View/detail_page.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     final color = HexColor.fromHex(task.color);
     final squareWidth = Get.width - 12.0.wp;

     return GestureDetector(
       onTap: (){
         homeCtrl.changeTask(task);
         homeCtrl.changeTodos(task.todos ?? []);
         Get.to(DetailPage());
       },
       child: Container(
         width: squareWidth / 2,
         height: squareWidth / 2,
         margin: EdgeInsets.all(3.0.wp),
         decoration: BoxDecoration(
           color: Colors.white,
           boxShadow: [
             BoxShadow(
               color: Colors.grey[300]!,
               blurRadius: 7,
               offset: const Offset(0, 7)

             ),
           ]
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             StepProgressIndicator(
               // TODO change after finish CRUD
               totalSteps: homeCtrl.isTodoEmpty(task) ? 1 : task.todos!.length,
               currentStep: homeCtrl.isTodoEmpty(task) ? 0 : homeCtrl.getDoneTodo(task),
               size: 5,
               padding: 0,
               selectedGradientColor: LinearGradient(
                 begin: Alignment.topLeft,
                 end: Alignment.bottomRight,
                 colors: [color.withOpacity(0.5),color]
               ),
               unselectedGradientColor: const LinearGradient(
                   begin: Alignment.topLeft,
                   end: Alignment.bottomRight,
                   colors: [Colors.white,Colors.white]
               ),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Icon(IconData(task.icon,fontFamily: 'MaterialIcons'),
               color: color,),
             ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(task.title, style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 12.0.sp,
                   ),overflow: TextOverflow.ellipsis,),
                   Text('${task.todos?.length ?? 0} Task', style: const TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.grey
                   ),)
                 ],
               ),
             ),
           ],
         ),
       ),
     );
   }
 }
 