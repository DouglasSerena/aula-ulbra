import 'package:ap1/layout/app_bar_common_layout.dart';
import 'package:ap1/layout/drawer_common_layout.dart';
import 'package:flutter/material.dart';

class ClassroomScreen extends StatefulWidget {
  const ClassroomScreen({Key? key}) : super(key: key);

  @override
  State<ClassroomScreen> createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommonLayout(),
      drawer: DrawerCommonLayout(),
      body: SafeArea(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
