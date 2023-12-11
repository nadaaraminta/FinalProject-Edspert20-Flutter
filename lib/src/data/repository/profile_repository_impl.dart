import 'package:firebase_auth/firebase_auth.dart';
import 'package:edspert_20/src/data/datasource/remote/authentication_remote_datasource.dart';
import 'package:edspert_20/src/data/datasource/remote/profile_remote_datasource.dart';
import 'package:edspert_20/src/data/model/model.dart';
import 'package:edspert_20/src/domain/entity/authentication_response_entity.dart';
import 'package:edspert_20/src/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final AuthRemoteDatasource authRemoteDatasource;
  final ProfileRemoteDatasource profileRemoteDatasource;

  ProfileRepositoryImpl({
    required this.authRemoteDatasource,
    required this.profileRemoteDatasource,
  });

  @override
  Future<UserDataEntity?> getProfile() async {
    UserResponseModel? userModel =
        await authRemoteDatasource.getUserByEmail(email: FirebaseAuth.instance.currentUser?.email ?? '');
    if (userModel != null) {
      final data = UserDataEntity(
        iduser: userModel.data?.iduser ?? '',
        userName: userModel.data?.userName ?? '',
        userEmail: userModel.data?.userEmail ?? '',
        userFoto: userModel.data?.userFoto ?? '',
        userAsalSekolah: userModel.data?.userAsalSekolah ?? '',
        dateCreate: userModel.data?.dateCreate ?? '',
        jenjang: userModel.data?.jenjang ?? '',
        userGender: userModel.data?.userGender ?? '',
        userStatus: userModel.data?.userStatus ?? '',
      );
      return data;
    }
    return null;
  }

  @override
  Future<bool> updateProfile({
    required String fullName,
    required String email,
    required String schoolName,
    required String schoolLevel,
    required String schoolGrade,
    required String gender,
    String? photoUrl,
  }) async {
    bool result = await profileRemoteDatasource.updateProfile(
      fullName: fullName,
      email: email,
      schoolName: schoolName,
      schoolLevel: schoolLevel,
      schoolGrade: schoolGrade,
      gender: gender,
      photoUrl: photoUrl,
    );
    return result;
  }
}
