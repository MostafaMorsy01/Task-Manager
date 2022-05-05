import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controller/controller.dart';
import 'package:taskmanager/Helper/extensions.dart';
import 'package:taskmanager/Helper/theme.dart';
import 'package:taskmanager/Model/task.dart';
import 'package:taskmanager/Services/Themes_Service.dart';
import 'package:taskmanager/Widgets/add_card.dart';
import 'package:taskmanager/Widgets/add_dialog.dart';
import 'package:taskmanager/Widgets/task_card.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding:EdgeInsets.all(4.0.wp),
              child: Text('My List', style: TextStyle(
                fontSize: 24.0.sp,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Obx(() => GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  ...controller.tasks.map((element) => LongPressDraggable(
                      data: element,
                      onDragStarted:() => controller.changeDeleting(true),
                      onDraggableCanceled: (_,__) => controller.changeDeleting(false),
                      onDragEnd: (_) => controller.changeDeleting(false),
                      feedback: Opacity(
                        opacity: 0.8,
                        child: TaskCard(task: element,),
                      ),
                      child: TaskCard(task: element))).toList(),
                  AddCard(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: DragTarget<Task>(
        builder: (_,__,___) {
          return Obx(() => FloatingActionButton(
            backgroundColor: controller.deleting.value ? Colors.redAccent : blue,
            onPressed: () {
              if(controller.tasks.isNotEmpty){
                Get.to(AddDialog(), transition: Transition.downToUp);
              } else {
                EasyLoading.showError('Please Create Your Task Type');
              }
            },
            child: Icon(controller.deleting.value ? Icons.delete : Icons.add),
          ),
          );
        },
        onAccept: (Task task) {
          controller.deleteTask(task);
          EasyLoading.showSuccess('Deleting Success');
        },
      ),
    );
  }
}
