import 'package:ap1/cubit/classroom/classroom_cubit.dart';
import 'package:ap1/cubit/classroom/model/classroom_item_model.dart';
import 'package:ap1/domain/classes/select_item.dart';
import 'package:ap1/layout/app_bar_common_layout.dart';
import 'package:ap1/layout/drawer_common_layout.dart';
import 'package:ap1/modules/classroom/screen/block/classroom_card_block_screen.dart';
import 'package:ap1/widgets/select_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassroomScreen extends StatefulWidget {
  ClassroomItemModel classroomItem;

  ClassroomScreen({
    Key? key,
    required this.classroomItem,
  }) : super(key: key);

  @override
  State<ClassroomScreen> createState() =>
      _ClassroomScreenState(classroomItem: classroomItem);
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  ClassroomItemModel classroomItem;

  _ClassroomScreenState({required this.classroomItem});

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
      appBar: AppBarCommonLayout(back: true),
      drawer: DrawerCommonLayout(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Roteiro de aprendizagem",
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
              const Text(
                "Turma",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SelectWidget(
                onChange: (String id) {
                  ClassroomItemModel classroomItem =
                      BlocProvider.of<ClassroomCubit>(context)
                          .getById(int.parse(id));

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ClassroomScreen(
                        classroomItem: classroomItem,
                      );
                    }),
                  );
                },
                selected: classroomItem.id.toString(),
                items: classroomItens
                    .map((classroomItem) => SelectItem(
                          value: classroomItem.id.toString(),
                          label: classroomItem.title,
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20),
              ClassroomCardBlockScreen(classroomItem: classroomItem)
            ],
          ),
        ),
      ),
    );
  }
}
