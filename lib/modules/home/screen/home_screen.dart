import 'package:ap1/domain/classroom_item.dart';
import 'package:ap1/domain/select_item.dart';
import 'package:ap1/layout/app_bar_common_layout.dart';
import 'package:ap1/layout/drawer_common_layout.dart';
import 'package:ap1/modules/classroom/classroom_module.dart';
import 'package:ap1/widgets/classroom_card_widget.dart';
import 'package:ap1/widgets/select_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ClassroomItem> classroomItens = [
    ClassroomItem(
      quests: 2,
      completed: 0.8,
      title: "Banco de Dados",
      color: Colors.blueAccent,
      teacher: "Cassio Huggentobler de Costa",
      classroom: "0067-A - 41N - Graduação",
    ),
    ClassroomItem(
      completed: 0.53,
      color: Colors.brown,
      teacher: "Vinicius Silveira Magnus",
      title: "Plataformas Computacionais",
      classroom: "0087-A - 21N/22N - Graduação",
    ),
    ClassroomItem(
      alerts: 2,
      completed: 0.2,
      color: Colors.green,
      teacher: "Ramon dos Santos Lummertz",
      classroom: "0067-A - 41N - Graduação",
      title: "Desenvolvimento de Sistemas Móveis",
    ),
    ClassroomItem(
      alerts: 4,
      quests: 1,
      completed: 0.5,
      color: Colors.red,
      teacher: "Maria Adelina Raupp Sganzerla",
      title: "Interface Humano-Computador",
      classroom: "80306 - EAD - 71M72M - SEMESTRE - Graduação",
    ),
  ];

  _HomeScreenState();

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
              const SizedBox(height: 10),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: classroomItens.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return ClassroomCardWidget(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return const ClassroomScreen();
                        }),
                      ),
                      classroom: classroomItens[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
