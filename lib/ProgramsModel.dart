class ProgramsQueryModel {
  String programName;
  String programCategory;
  String programLesson;

  ProgramsQueryModel({
    this.programName = "programName",
    this.programCategory = "programCategory",
    this.programLesson = "programLesson"
  });

  factory ProgramsQueryModel.fromMap(Map programs){
    return ProgramsQueryModel(
        programName:programs["name"],
        programLesson: programs["lesson"].toString(),
        programCategory: programs["category"]
    );
  }
}