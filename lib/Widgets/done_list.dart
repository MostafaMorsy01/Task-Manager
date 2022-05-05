import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controller/controller.dart';
import 'package:taskmanager/Helper/extensions.dart';
import 'package:taskmanager/Helper/theme.dart';

class DoneList extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
   DoneList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => homeCtrl.doneTodos.isNotEmpty
        ? ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Compeleted(${homeCtrl.doneTodos.length})',style: TextStyle(
            fontSize: 14.0.sp,
            color: Colors.grey
          ),),
        ),
        ...homeCtrl.doneTodos.map((element) =>
          Dismissible(
            key: ObjectKey(element),
            direction: DismissDirection.endToStart,
            onDismissed: (_) => homeCtrl.deleteDoneTodo(element),
            background: Container(
              color: Colors.red.withOpacity(0.8),
              alignment: Alignment.centerRight,
              child: Icon(Icons.delete, color: Colors.white,),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 9.0.wp, vertical: 3.0.wp),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: Icon(Icons.done, color: blue,),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.0.wp),
                    child: Text(element['title'], style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      decoration: TextDecoration.lineThrough
                    ),),
                  )
                ],
              ),
            ),
          )
        ).toList()
      ],
    ) : Container()
    );
  }
}
