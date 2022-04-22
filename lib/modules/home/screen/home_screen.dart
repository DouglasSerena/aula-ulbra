import 'package:ap1/layout/app_bar_common_layout.dart';
import 'package:ap1/layout/drawer_common_layout.dart';
import 'package:ap1/widgets/select_widget.dart';
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
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Salas virtuais",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Período",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SelectWidget(
                selected: "1",
                items: [
                  SelectItem(value: "1", label: "2022/1"),
                  SelectItem(value: "2", label: "2021/2"),
                  SelectItem(value: "3", label: "2021/1"),
                  SelectItem(value: "4", label: "2020/2"),
                  SelectItem(value: "5", label: "2020/1"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
