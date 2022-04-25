import 'package:flutter/cupertino.dart';

class ClassroomItemModel {
  static int unique = 0;

  int id = ++ClassroomItemModel.unique;
  Color color;
  String title;
  String teacher;
  String classroom;
  String? description;

  double completed;

  int commits;
  int quests;
  int alerts;

  ClassroomItemModel({
    required this.color,
    required this.title,
    required this.teacher,
    required this.classroom,
    this.completed = 0,
    this.description,
    this.commits = 0,
    this.quests = 0,
    this.alerts = 0,
  });

  bool equal(ClassroomItemModel classroom) {
    return classroom.id == id;
  }
}
