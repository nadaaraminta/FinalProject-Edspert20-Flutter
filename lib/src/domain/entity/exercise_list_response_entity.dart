class ExerciseListResponseEntity {
  int status;
  String message;
  List<ExerciseDataEntity> data;

  ExerciseListResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class ExerciseDataEntity {
  String exerciseId;
  String exerciseTitle;
  String accessType;
  String icon;
  String exerciseUserStatus;
  String jumlahSoal;
  int jumlahDone;

  ExerciseDataEntity({
    required this.exerciseId,
    required this.exerciseTitle,
    required this.accessType,
    required this.icon,
    required this.exerciseUserStatus,
    required this.jumlahSoal,
    required this.jumlahDone,
  });
}
