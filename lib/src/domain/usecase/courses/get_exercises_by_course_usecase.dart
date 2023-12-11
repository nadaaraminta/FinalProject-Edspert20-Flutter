import 'package:edspert_20/src/domain/repository/exercise_repository.dart';

import '../../entity/exercise_list_response_entity.dart';

class GetExercisesByCourseUsecase {
  final ExerciseRepository repository;

  const GetExercisesByCourseUsecase({required this.repository});

  Future<List<ExerciseDataEntity>?> call(String courseId) async => await repository.getExercisesByCourse(courseId);
}
