import 'package:edspert_20/src/domain/entity/banner_response_entity.dart';
import 'package:edspert_20/src/domain/repository/banner_repository.dart';

class GetBannersUsecase {
  final BannerRepository repository;

  const GetBannersUsecase({required this.repository});

  Future<List<BannerDataEntity>?> call() async => await repository.getBanners();
}
