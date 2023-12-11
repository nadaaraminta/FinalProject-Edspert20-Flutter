import 'package:edspert_20/src/domain/repository/authentication_repository.dart';

class IsSignedInWithGoogleUsecase {
  final AuthRepository repository;

  const IsSignedInWithGoogleUsecase({required this.repository});

  bool call() => repository.isSignedInWithGoogle();
}
