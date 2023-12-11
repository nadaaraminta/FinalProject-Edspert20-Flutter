import 'package:edspert_20/src/data/datasource/remote/exercise_remote_datasource.dart';
import 'package:edspert_20/src/data/model/exercise_list_response_model.dart';
import 'package:edspert_20/src/domain/entity/exercise_list_response_entity.dart';
import 'package:edspert_20/src/domain/repository/exercise_repository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDatasource remoteDatasource;
  const ExerciseRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<ExerciseDataEntity>?> getExercisesByCourse(
    String courseId,
  ) async {
    final response = await remoteDatasource.getExercises(
      courseId,
    );

    if (response.data == null) {
      return null;
    }

    final data = ExerciseListResponseEntity(
      status: response.status ?? -1,
      message: response.message ?? '',
      data: List<ExerciseDataModel>.from(response.data ?? [])
          .map(
            (e) => ExerciseDataEntity(
              exerciseId: e.exerciseId ?? '',
              exerciseTitle: e.exerciseTitle ?? '',
              accessType: e.accessType ?? '',
              icon: e.icon ?? '',
              exerciseUserStatus: e.exerciseUserStatus ?? '',
              jumlahSoal: e.jumlahSoal ?? '',
              jumlahDone: e.jumlahDone ?? 0,
            ),
          )
          .toList(),
    );

    return data.data;
  }
}