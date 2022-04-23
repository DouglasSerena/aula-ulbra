import 'package:ap1/domain/classroom_item.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ClassroomCardWidget extends StatefulWidget {
  void Function()? onPressed;
  ClassroomItem classroom;

  ClassroomCardWidget({
    Key? key,
    required this.onPressed,
    required this.classroom,
  }) : super(key: key);

  @override
  State<ClassroomCardWidget> createState() =>
      _ClassroomCardWidgetState(onPressed: onPressed, classroom: classroom);
}

class _ClassroomCardWidgetState extends State<ClassroomCardWidget> {
  void Function()? onPressed;
  ClassroomItem classroom;

  _ClassroomCardWidgetState({
    required this.onPressed,
    required this.classroom,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: classroom.color,
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
                        classroom.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Turma: ${classroom.classroom}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 3.0,
                  percent: classroom.completed,
                  progressColor: Colors.amber,
                  center: Text(
                    "${classroom.completed * 100}%",
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
                showBadge: classroom.quests > 0,
                badgeContent: Text("${classroom.quests}"),
                child: Icon(
                  Icons.star,
                  color: classroom.quests > 0 ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(width: 30),
              Badge(
                showBadge: classroom.commits > 0,
                badgeContent: Text("${classroom.commits}"),
                child: Icon(
                  Icons.insert_comment,
                  color: classroom.commits > 0 ? Colors.black : Colors.grey,
                ),
              ),
              const SizedBox(width: 30),
              Badge(
                showBadge: classroom.alerts > 0,
                badgeContent: Text("${classroom.alerts}"),
                child: Icon(
                  Icons.info,
                  color: classroom.alerts > 0 ? Colors.black : Colors.grey,
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
