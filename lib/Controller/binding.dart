import 'package:get/get.dart';
import 'package:taskmanager/Controller/controller.dart';
import 'package:taskmanager/Services/Provider/provider.dart';
import 'package:taskmanager/Services/Reposiotry/repo.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(taskRepository: TaskRepository(taskProvider: TaskProvider())));
  }

}