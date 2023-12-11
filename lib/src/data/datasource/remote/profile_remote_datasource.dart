import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_20/src/data/model/update_profile_request_model.dart';
import 'package:edspert_20/src/values/constants/constants.dart';

class ProfileRemoteDatasource {
  final Dio client;

  const ProfileRemoteDatasource({required this.client});

  Future<bool> updateProfile({
    required String fullName,
    required String email,
    required String schoolName,
    required String schoolLevel,
    required String schoolGrade,
    required String gender,
    String? photoUrl,
  }) async {
    try {
      const String url = 'https://edspert.widyaedu.com/users/update';

      final result = await client.post(
        url,
        options: Options(
          headers: GetConstants.headers.toJson()
        ),
        data: FormData.fromMap(
          UpdateProfileRequestModel(
            fullName: fullName,
            email: email,
            schoolName: schoolName,
            schoolLevel: schoolLevel,
            schoolGrade: schoolGrade,
            gender: gender,
            photoUrl: photoUrl,
          ).toMap(),
        ),
      );

      if (result.data['message'] == "update sukses") {
        return true;
      }
      return false;
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return false;
    }
  }
}
