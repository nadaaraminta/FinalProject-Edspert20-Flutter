import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_20/src/data/model/exercise_list_response_model.dart';
import 'package:edspert_20/src/values/constants/constants.dart';

class ExerciseRemoteDatasource {
  final Dio client;

  const ExerciseRemoteDatasource({
    required this.client,
  });

  Future<ExerciseListResponseModel> getExercises(String courseId) async {
    try {
      var urlGetExercises = 'https://edspert.widyaedu.com/exercise/data_exercise?course_id=$courseId&user_email=testerngbayu@gmail.com';
      log(urlGetExercises);

      const String url = 'https://edspert.widyaedu.com/exercise/data_exercise';

      final result = await Dio().get(
        url,
        queryParameters: {
          'course_id': courseId,
          'user_email': 'testerngbayu@gmail.com',
        },
        options: Options(
          headers: GetConstants.headers.toJson()
        ),
      );

      return ExerciseListResponseModel.fromJson(result.data);
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return ExerciseListResponseModel();
    }
  }
}