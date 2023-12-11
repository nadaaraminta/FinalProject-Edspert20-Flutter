class ExerciseResultResponseModel {
  int? status;
  String? message;
  ExerciseResultDataModel? data;

  ExerciseResultResponseModel({this.status, this.message, this.data});

  ExerciseResultResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ExerciseResultDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ExerciseResultDataModel {
  ExerciseModel? exercise;
  ResultModel? result;

  ExerciseResultDataModel({this.exercise, this.result});

  ExerciseResultDataModel.fromJson(Map<String, dynamic> json) {
    exercise = json['exercise'] != null ? ExerciseModel.fromJson(json['exercise']) : null;
    result = json['result'] != null ? ResultModel.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (exercise != null) {
      data['exercise'] = exercise!.toJson();
    }
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class ExerciseModel {
  String? exerciseId;
  String? exerciseCode;
  String? fileCourse;
  String? icon;
  String? exerciseTitle;
  String? exerciseDescription;
  String? exerciseInstruction;
  String? countQuestion;
  String? classFk;
  String? courseFk;
  String? courseContentFk;
  String? subCourseContentFk;
  String? creatorId;
  String? creatorName;
  String? examFrom;
  String? accessType;
  String? exerciseOrder;
  String? exerciseStatus;
  String? dateCreate;
  String? dateUpdate;

  ExerciseModel({
    this.exerciseId,
    this.exerciseCode,
    this.fileCourse,
    this.icon,
    this.exerciseTitle,
    this.exerciseDescription,
    this.exerciseInstruction,
    this.countQuestion,
    this.classFk,
    this.courseFk,
    this.courseContentFk,
    this.subCourseContentFk,
    this.creatorId,
    this.creatorName,
    this.examFrom,
    this.accessType,
    this.exerciseOrder,
    this.exerciseStatus,
    this.dateCreate,
    this.dateUpdate,
  });

  ExerciseModel.fromJson(Map<String, dynamic> json) {
    exerciseId = json['exercise_id'];
    exerciseCode = json['exercise_code'];
    fileCourse = json['file_course'];
    icon = json['icon'];
    exerciseTitle = json['exercise_title'];
    exerciseDescription = json['exercise_description'];
    exerciseInstruction = json['exercise_instruction'];
    countQuestion = json['count_question'];
    classFk = json['class_fk'];
    courseFk = json['course_fk'];
    courseContentFk = json['course_content_fk'];
    subCourseContentFk = json['sub_course_content_fk'];
    creatorId = json['creator_id'];
    creatorName = json['creator_name'];
    examFrom = json['exam_from'];
    accessType = json['access_type'];
    exerciseOrder = json['exercise_order'];
    exerciseStatus = json['exercise_status'];
    dateCreate = json['date_create'];
    dateUpdate = json['date_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['exercise_id'] = exerciseId;
    data['exercise_code'] = exerciseCode;
    data['file_course'] = fileCourse;
    data['icon'] = icon;
    data['exercise_title'] = exerciseTitle;
    data['exercise_description'] = exerciseDescription;
    data['exercise_instruction'] = exerciseInstruction;
    data['count_question'] = countQuestion;
    data['class_fk'] = classFk;
    data['course_fk'] = courseFk;
    data['course_content_fk'] = courseContentFk;
    data['sub_course_content_fk'] = subCourseContentFk;
    data['creator_id'] = creatorId;
    data['creator_name'] = creatorName;
    data['exam_from'] = examFrom;
    data['access_type'] = accessType;
    data['exercise_order'] = exerciseOrder;
    data['exercise_status'] = exerciseStatus;
    data['date_create'] = dateCreate;
    data['date_update'] = dateUpdate;
    return data;
  }
}

class ResultModel {
  String? jumlahBenar;
  String? jumlahSalah;
  String? jumlahTidak;
  String? jumlahScore;

  ResultModel({this.jumlahBenar, this.jumlahSalah, this.jumlahTidak, this.jumlahScore});

  ResultModel.fromJson(Map<String, dynamic> json) {
    jumlahBenar = json['jumlah_benar'];
    jumlahSalah = json['jumlah_salah'];
    jumlahTidak = json['jumlah_tidak'];
    jumlahScore = json['jumlah_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jumlah_benar'] = jumlahBenar;
    data['jumlah_salah'] = jumlahSalah;
    data['jumlah_tidak'] = jumlahTidak;
    data['jumlah_score'] = jumlahScore;
    return data;
  }
}
