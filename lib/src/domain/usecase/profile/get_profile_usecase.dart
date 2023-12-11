import 'package:edspert_20/src/domain/repository/profile_repository.dart';

import '../../entity/authentication_response_entity.dart';

class GetProfileUsecase {
  final ProfileRepository repository;

  const GetProfileUsecase({required this.repository});

  Future<UserDataEntity?> call() async => await repository.getProfile();
}
