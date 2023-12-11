part of 'banner_bloc.dart';

@immutable
class BannerState {}

final class BannerInitial extends BannerState {}

class BannerLoadingState extends BannerState {}

class BannerSuccessState extends BannerState {
  final List<BannerDataEntity> banners;

  BannerSuccessState({required this.banners});
}

class BannerFailedState extends BannerState {
  final String errorMessage;

  BannerFailedState({required this.errorMessage});
}
