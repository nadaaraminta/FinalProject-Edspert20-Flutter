import 'package:edspert_20/src/domain/repository/authentication_repository.dart';

import '../../entity/authentication_response_entity.dart';

class GetUserUsecase {
  final AuthRepository repository;

  const GetUserUsecase({required this.repository});

  Future<UserDataEntity?> call(String email) async => await repository.getUserByEmail(email: email);
}
