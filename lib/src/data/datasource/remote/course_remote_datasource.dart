import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_20/src/values/constants/constants.dart';

import '../../model/model.dart';

class CourseRemoteDatasource {
  final Dio client;

  const CourseRemoteDatasource({
    required this.client,
  });

  Future<CourseListResponseModel> getCourses(String majorName) async {
    try {
      var urlGetCourses = 'https://edspert.widyaedu.com/exercise/data_course?major_name=$majorName&user_email=testerngbayu@gmail.com';
      log(urlGetCourses);

      const url = 'https://edspert.widyaedu.com/exercise/data_course';

      final result = await Dio().get(
        url,
        queryParameters: {
          'major_name': majorName,
          'user_email': 'testerngbayu@gmail.com',
        },
        options: Options(
          headers: GetConstants.headers.toJson()
        ),
      );

      return CourseListResponseModel.fromJson(result.data);
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return CourseListResponseModel();
    }
  }

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

      log(result.data.toString());
      return ExerciseListResponseModel.fromJson(result.data);
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return ExerciseListResponseModel();
    }
  }

  Future<QuestionListResponseModel> getQuestions({required String exerciseId, required String email}) async {
    try {
      var dataExerciseId = exerciseId;
      var dataUserEmail = email;
      log(dataExerciseId);
      log(dataUserEmail);

      const String url = 'https://edspert.widyaedu.com/exercise/kerjakan';

      final result = await Dio().post(
        url,
        data: {
          'exercise_id': exerciseId,
          'user_email': email,
        },
        options: Options(
          headers: GetConstants.headers.toJson()
        ),
      );
      return QuestionListResponseModel.fromJson(result.data);
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return QuestionListResponseModel();
    }
  }

  Future<bool> submitAnswers({required SubmitAnswerRequestModel request}) async {
    try {
      var dataRequest = request.toMap();
      log(dataRequest as String);

      const String url = 'https://edspert.widyaedu.com/exercise/input_jawaban';

      final result = await Dio().post(
        url,
        data: request.toMap(),
        options: Options(
          headers: GetConstants.headers.toJson()
        ),
      );

      log('result... ${result.data}');
      if (result.data['message'] == 'Sukses input jawaban') {
        return true;
      }

      return false;
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return false;
    }
  }

  Future<ExerciseResultResponseModel> getExerciseResult({required String exerciseId, required String email}) async {
    try {
      var urlGetExerciseResult = 'https://edspert.widyaedu.com/exercise/score_result?exercise_id=$exerciseId&user_email=$email';
      log(urlGetExerciseResult);

      const String url = 'https://edspert.widyaedu.com/exercise/score_result';

      final result = await Dio().get(
        url,
        queryParameters: {
          'exercise_id': exerciseId,
          'user_email': email,
        },
        options: Options(
          headers: GetConstants.headers.toJson()
        ),
      );
      return ExerciseResultResponseModel.fromJson(result.data);
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return ExerciseResultResponseModel();
    }
  }
}
