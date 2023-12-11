import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_20/src/values/constants/constants.dart';
import '../../model/register_user_request_model.dart';
import '../../model/authentication_response_model.dart';

class AuthRemoteDatasource {
  final Dio client;

  const AuthRemoteDatasource({required this.client});

  Future<UserResponseModel?> getUserByEmail({required String email}) async {
    try {
      var urlGetUserByEmail = 'https://edspert.widyaedu.com/users?email=$email';
      log(urlGetUserByEmail);

      const String url = 'https://edspert.widyaedu.com/users';

      final result = await client.get(
        url,
        queryParameters: {
          'email': email,
        },
        options: Options(
          headers: GetConstants.headers.toJson()
        ),
      );

      final userData = UserResponseModel.fromJson(result.data);

      return userData;
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return null;
    }
  }

  Future<UserResponseModel> registerUser({required RegisterUserRequestModel request}) async {
    try {
      var urlRegisterUser = 'https://edspert.widyaedu.com/users/registrasi';
      log(urlRegisterUser);

      const String url = 'https://edspert.widyaedu.com/users/registrasi';

      final result = await client.post(
        url,
        options: Options(
          headers: GetConstants.headers.toJson()
        ),
        data: request.toMap(),
      );

      final userData = UserResponseModel.fromJson(result.data);

      return userData;
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return UserResponseModel();
    }
  }
}
