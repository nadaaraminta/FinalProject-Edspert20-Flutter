import 'package:edspert_20/src/domain/repository/authentication_repository.dart';

class IsUserRegisteredUsecase {
  final AuthRepository repository;

  const IsUserRegisteredUsecase({required this.repository});

  Future<bool> call() async => await repository.isUserRegistered();
}
