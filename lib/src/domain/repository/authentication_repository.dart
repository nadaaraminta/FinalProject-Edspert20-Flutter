import 'package:firebase_auth/firebase_auth.dart';

import '../../data/model/model.dart';
import '../entity/authentication_response_entity.dart';

/// Interface
abstract class AuthRepository {
  bool isSignedInWithGoogle();

  String? getCurrentSignedInEmail();

  Future<UserDataEntity?> getUserByEmail({required String email});

  Future<bool> registerUser({required RegisterUserRequestModel request});

  Future<bool> isUserRegistered();

  Future<bool> signOut();

  Future<User?> signInWithGoogle();
}
