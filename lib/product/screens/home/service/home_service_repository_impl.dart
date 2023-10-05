import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voco/feature/constants/paths/service_tools.dart';
import 'package:voco/feature/exceptions/custom_service_exceptions.dart';
import 'package:voco/feature/models/login_model.dart';
import 'package:voco/feature/models/resources_model.dart';

import 'home_service_repository.dart';

class HomeServiceRepositoryImpl extends HomeServiceRepository {
  @override
  Future<Either<List<ResourcesModel>, CustomServiceException>> getResources(index) async {
    List<ResourcesModel> resourcesModel = [];

    String url = '${ServiceTools.resourcesUrl}$index';
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
}
