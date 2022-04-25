import 'package:ap1/cubit/classroom/classroom_cubit.dart';
import 'package:ap1/cubit/classroom/model/classroom_item_model.dart';
import 'package:ap1/domain/classes/select_item.dart';
import 'package:ap1/layout/app_bar_common_layout.dart';
import 'package:ap1/layout/drawer_common_layout.dart';
import 'package:ap1/modules/classroom/classroom_module.dart';
import 'package:ap1/widgets/classroom_card_widget.dart';
import 'package:ap1/widgets/select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClassroomCubit(),
      child: BlocBuilder<ClassroomCubit, List<ClassroomItemModel>>(
        builder: _build,
      ),
    );
  }

  @override
  Widget _build(BuildContext context, List<ClassroomItemModel> classroomItens) {
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
                onChange: (String id) => print("OK"),
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
                          return ClassroomScreen(
                            classroomItem: classroomItens[index],
                          );
                        }),
                      ),
                      classroomItem: classroomItens[index],
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
