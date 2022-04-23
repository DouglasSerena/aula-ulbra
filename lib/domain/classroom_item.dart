import 'package:flutter/cupertino.dart';

class ClassroomItem {
  Color color;
  String title;
  String teacher;
  String classroom;
  String? description;

  double completed = 0;

  int commits = 0;
  int quests = 0;
  int alerts = 0;

  ClassroomItem({
    required this.color,
    required this.title,
    required this.teacher,
    required this.classroom,
    this.description,
    double? completed,
    int? commits,
    int? quests,
    int? alerts,
  }) {
    this.completed = completed ?? this.completed;
    this.commits = commits ?? this.commits;
    this.quests = quests ?? this.quests;
    this.alerts = alerts ?? this.alerts;
  }
}
