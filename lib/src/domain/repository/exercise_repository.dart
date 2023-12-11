import 'package:edspert_20/src/domain/entity/exercise_list_response_entity.dart';

abstract class ExerciseRepository {
  Future<List<ExerciseDataEntity>?> getExercisesByCourse(String courseId);
  // getExercisesByCourse(String courseId) {}
}