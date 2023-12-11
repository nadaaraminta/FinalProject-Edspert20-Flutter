import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:edspert_20/src/domain/entity/banner_response_entity.dart';
import 'package:edspert_20/src/domain/usecase/banner/get_banners_usecase.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannersUsecase getBannersUsecase;

  BannerBloc({required this.getBannersUsecase}) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is BannersEvent) {
        /// Set Loading
        emit(BannerLoadingState());

        /// Set Result
        List<BannerDataEntity>? data = await getBannersUsecase();
        if (data == null) {
          emit(BannerFailedState(errorMessage: 'Something went wrong!'));
        } else {
          emit(BannerSuccessState(banners: data));
        }
      }
    });
  }
}
