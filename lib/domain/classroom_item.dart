class ClassroomItem {
  String title;
  String classroom;

  double? completed = 0;

  int? commits = 0;
  int? quests = 0;
  int? alerts = 0;

  ClassroomItem({
    required this.title,
    required this.classroom,
    this.completed,
    this.commits,
    this.quests,
    this.alerts,
  });
}
