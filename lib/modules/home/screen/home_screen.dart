import 'package:ap1/layout/app_bar_common_layout.dart';
import 'package:ap1/layout/drawer_common_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
