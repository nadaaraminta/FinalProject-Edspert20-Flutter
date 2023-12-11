import 'package:edspert_20/src/domain/repository/authentication_repository.dart';

class GetCurrentSignedInEmailUsecase {
  final AuthRepository repository;

  const GetCurrentSignedInEmailUsecase({required this.repository});

  String? call() => repository.getCurrentSignedInEmail();
}
