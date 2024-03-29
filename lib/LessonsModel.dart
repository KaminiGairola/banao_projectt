class LessonsQueryModel{

  String? lessonsName;
  String? lessonsDuration;
  String? lessonsCategory;
  bool? lessonsLocked;

  LessonsQueryModel(
      {this.lessonsName = "Lesson Name",
        this.lessonsDuration = "Lesson Duration",
        this.lessonsCategory = "Lesson Category",
        this.lessonsLocked});

  factory LessonsQueryModel.fromMap(Map lessons) {
    return LessonsQueryModel(
        lessonsName: lessons["name"],
        lessonsDuration: lessons["duration"].toString(),
        lessonsCategory: lessons["category"],
        lessonsLocked: lessons["locked"]);
  }

  }