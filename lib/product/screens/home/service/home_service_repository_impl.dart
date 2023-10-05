import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voco/feature/constants/paths/service_tools.dart';
import 'package:voco/feature/exceptions/custom_service_exceptions.dart';
import 'package:voco/feature/models/login_model.dart';
import 'package:voco/feature/models/resources_model.dart';

import 'home_service_repository.dart';

class HomeServiceRepositoryImpl extends HomeServiceRepository {
  @override
  Future<Either<List<ResourcesModel>, CustomServiceException>> getResources() async {
    List<ResourcesModel> resourcesModel = [];

    String url = ServiceTools.loginUrl;
    try {
      final response = await super.dio.get(
            url,
            options: Options(),
          );
      final data = response.data;
      resourcesModel = ResourcesModel.fromJsonList(data['data']);
      return Left(resourcesModel);
    } catch (error) {
      super.logger.e(error.toString());
      return Right(CustomServiceException(message: CustomServiceMessages.loginError, statusCode: '400'));
    }
  }

  // @override
  // Future<Either<CheckAccesTokenModel, CustomServiceException>> checkAccessToken(String token) async {
  //   String url = '${ServiceTools.url.users_url}/user/checkAccessToken';

  //   try {
  //     final response = await super.dio.post(url,
  //         options: Options(
  //           headers: {'Homeorization': 'Bearer $token'},
  //           sendTimeout: const Duration(seconds: 4),
  //           receiveTimeout: const Duration(seconds: 4),
  //           responseType: ResponseType.json,
  //         ));
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       final data = response.data;

  //       CheckAccesTokenModel checkAccesTokenModel = CheckAccesTokenModel.fromJson(data);

  //       return Left(checkAccesTokenModel);
  //     } else {
  //       return Right(CustomServiceException(message: CustomServiceMessages.tokenChangeError, statusCode: '400'));
  //     }
  //   } catch (error) {
  //     super.logger.e(error.toString());
  //     return Right(CustomServiceException(message: CustomServiceMessages.tokenChangeError, statusCode: '400'));
  //   }
  // }
}
