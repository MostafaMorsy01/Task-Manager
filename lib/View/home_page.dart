import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controller/controller.dart';
import 'package:taskmanager/Helper/extensions.dart';
import 'package:taskmanager/Services/Themes_Service.dart';
import 'package:taskmanager/Widgets/add_card.dart';

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
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: [
                AddCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
