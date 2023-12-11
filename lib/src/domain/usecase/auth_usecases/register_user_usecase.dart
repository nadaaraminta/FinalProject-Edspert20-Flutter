import 'package:edspert_20/src/domain/repository/authentication_repository.dart';

import '../../../data/model/register_user_request_model.dart';

class RegisterUserUsecase {
  final AuthRepository repository;

  const RegisterUserUsecase({required this.repository});

  Future<bool> call(RegisterUserRequestModel request) async => await repository.registerUser(request: request);
}
