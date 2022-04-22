import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ClassroomCardWidget extends StatefulWidget {
  void Function()? onPressed;

  ClassroomCardWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  State<ClassroomCardWidget> createState() =>
      _ClassroomCardWidgetState(onPressed: onPressed);
}

class _ClassroomCardWidgetState extends State<ClassroomCardWidget> {
  void Function()? onPressed;

  _ClassroomCardWidgetState({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Banco de Dados",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Turma: 0067-A - 41N - Graduação",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 3.0,
                  percent: 0.5,
                  center:
                      const Text("50%", style: TextStyle(color: Colors.white)),
                  progressColor: Colors.amber,
                )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Badge(
                showBadge: true,
                badgeContent: const Text('3'),
                child: const Icon(Icons.star, color: Colors.black),
              ),
              const SizedBox(width: 30),
              Badge(
                showBadge: false,
                badgeContent: const Text('3'),
                child: const Icon(Icons.insert_comment, color: Colors.grey),
              ),
              const SizedBox(width: 30),
              Badge(
                showBadge: false,
                badgeContent: const Text('3'),
                child: const Icon(Icons.info, color: Colors.grey),
              )
            ],
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text("Entrar na sala"),
            ),
          ),
        ],
      ),
    );
  }
}
