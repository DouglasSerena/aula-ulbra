import 'package:ap1/cubit/classroom/model/classroom_item_model.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ClassroomCardWidget extends StatefulWidget {
  void Function()? onPressed;
  ClassroomItemModel classroomItem;

  ClassroomCardWidget({
    Key? key,
    required this.onPressed,
    required this.classroomItem,
  }) : super(key: key);

  @override
  State<ClassroomCardWidget> createState() => _ClassroomCardWidgetState(
        onPressed: onPressed,
        classroomItem: classroomItem,
      );
}

class _ClassroomCardWidgetState extends State<ClassroomCardWidget> {
  void Function()? onPressed;
  ClassroomItemModel classroomItem;

  _ClassroomCardWidgetState({
    required this.onPressed,
    required this.classroomItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: classroomItem.color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        classroomItem.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Turma: ${classroomItem.classroom}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 3.0,
                  percent: classroomItem.completed,
                  progressColor: Colors.amber,
                  center: Text(
                    "${classroomItem.completed * 100}%",
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Badge(
                showBadge: classroomItem.quests > 0,
                badgeContent: Text("${classroomItem.quests}"),
                child: Icon(
                  Icons.star,
                  color: classroomItem.quests > 0 ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(width: 30),
              Badge(
                showBadge: classroomItem.commits > 0,
                badgeContent: Text("${classroomItem.commits}"),
                child: Icon(
                  Icons.insert_comment,
                  color: classroomItem.commits > 0 ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(width: 30),
              Badge(
                showBadge: classroomItem.alerts > 0,
                badgeContent: Text("${classroomItem.alerts}"),
                child: Icon(
                  Icons.info,
                  color: classroomItem.alerts > 0 ? Colors.black : Colors.grey,
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: const Text("Entrar na sala"),
            ),
          ),
        ],
      ),
    );
  }
}
