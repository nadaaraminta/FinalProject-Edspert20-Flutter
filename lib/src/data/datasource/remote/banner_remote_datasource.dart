import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_20/src/values/constants/constants.dart';

import '../../model/banner_response_model.dart';

class BannerRemoteDatasource {
  final Dio client;

  const BannerRemoteDatasource({required this.client});

  Future<BannerResponseModel> getBanners() async {
    try {
      var urlGetBanners = 'https://edspert.widyaedu.com/event/list?limit=5';
      log(urlGetBanners);

      const url = 'https://edspert.widyaedu.com/event/list';

      final result = await client.get(
        url,
        queryParameters: {
          'limit': '5',
        },
        options: Options(
          headers: GetConstants.headers.toJson()
        ),
      );

      final bannerData = BannerResponseModel.fromJson(result.data);

      return bannerData;
    } catch (error, stacktrace) {
      log(error.toString(), stackTrace: stacktrace);
      return BannerResponseModel();
    }
  }
}
