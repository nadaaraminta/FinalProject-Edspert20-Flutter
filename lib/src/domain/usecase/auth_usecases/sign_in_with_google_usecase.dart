import 'package:firebase_auth/firebase_auth.dart';
import 'package:edspert_20/src/domain/repository/authentication_repository.dart';

class SignInWithGoogleUsecase {
  final AuthRepository repository;

  const SignInWithGoogleUsecase({required this.repository});

  Future<User?> call() async => await repository.signInWithGoogle();
}
