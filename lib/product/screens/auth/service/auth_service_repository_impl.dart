import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voco/feature/constants/paths/service_tools.dart';
import 'package:voco/feature/exceptions/custom_service_exceptions.dart';
import 'package:voco/feature/models/login_model.dart';

import 'auth_service_repository.dart';

class AuthServiceRepositoryImpl extends AuthServiceRepository {
  @override
  Future<Either<LoginModel, CustomServiceException>> login(String username, String password) async {
    @override
    String url = ServiceTools.loginUrl;
    try {
      final response = await super.dio.post(
            url,
            data: {'email': username, 'password': password},
            options: Options(),
          );

      final data = response.data;
      LoginModel loginModel = LoginModel.fromJson(data);
      return Left(loginModel);
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
  //           headers: {'authorization': 'Bearer $token'},
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
