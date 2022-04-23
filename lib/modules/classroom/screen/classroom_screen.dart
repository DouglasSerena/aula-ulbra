import 'package:ap1/domain/classroom_item.dart';
import 'package:ap1/domain/select_item.dart';
import 'package:ap1/layout/app_bar_common_layout.dart';
import 'package:ap1/layout/drawer_common_layout.dart';
import 'package:ap1/modules/classroom/screen/block/classroom_card_block_screen.dart';
import 'package:ap1/widgets/select_widget.dart';
import 'package:flutter/material.dart';

class ClassroomScreen extends StatefulWidget {
  const ClassroomScreen({Key? key}) : super(key: key);

  @override
  State<ClassroomScreen> createState() => _ClassroomScreenState();
}

class _ClassroomScreenState extends State<ClassroomScreen> {
  ClassroomItem classroom = ClassroomItem(
      quests: 2,
      completed: 0.8,
      color: Colors.blueAccent,
      title: "Banco de Dados",
      teacher: "Cassio Huggentobler de Costa",
      classroom: "0067-A - 41N - Graduação",
      description:
          "<div>Seja bem vindo &agrave; disciplina de Banco de Dados. Eu sou o professor C&aacute;ssio e estarei com voc&ecirc;s nesta jornada. Vamos pra cima. :)&nbsp;<br />&nbsp;<br />Tenha um &oacute;timo semestre.<br />&nbsp;<br />Plano de Aprendizagem<br />&nbsp;----</div><div>https://docs.google.com/document/d/14PtzTR15PVsTSjOcJp1DdU55UBwKFsrtjGUmgWn5usc/edit?usp=sharing</div><div><br />Meet<br />----</div><div><div>meet.google.com/qxf-yhdm-jaz</div><div>&nbsp;</div><div>&nbsp;</div>Link Canal no discord<br />----<br />https://discord.com/invite/SGkFsnJRnV</div><div>&nbsp;</div><div><br />Link Grava&ccedil;&otilde;es aulas<br />----</div><div>https://drive.google.com/drive/folders/14TjiHPyr3siAlOOC7CE6BhvfEbJeMf51?usp=sharing</div><div>&nbsp;</div><div><br />Datas Importantes<br />----<br />AP1 - 13/04<br />AP2 - 25/05<br />AS - 06/07<br />AF - 20/07<br />&nbsp;<br />&nbsp;<br />Datas Atividades Semi presenciais<br />----&nbsp;<br />26/03, 09/04, 23/04, 28/05,18/06</div>");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommonLayout(),
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
                selected: "1",
                items: [
                  SelectItem(
                      value: "1", label: "Banco de Dados - 0067-A - 41N"),
                  SelectItem(
                      value: "2",
                      label:
                          "Desenvolvimento de Sistemas Móveis - 0077-A - 31N"),
                  SelectItem(
                      value: "3",
                      label:
                          "Interface Humano-Computador - 80306 - EAD - 71M72M - SEMESTRE"),
                  SelectItem(
                      value: "4",
                      label: "Plataformas Computacionais - 0087-A - 21N/22N"),
                ],
              ),
              const SizedBox(height: 20),
              ClassroomCardBlockScreen(classroom: classroom)
            ],
          ),
        ),
      ),
    );
  }
}
