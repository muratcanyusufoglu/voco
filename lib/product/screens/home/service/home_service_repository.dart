import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:voco/feature/exceptions/custom_service_exceptions.dart';
import 'package:voco/feature/injection.dart';
import 'package:voco/feature/log/log_manager.dart';
import 'package:voco/feature/models/resources_model.dart';
import 'package:voco/feature/service/service_manager.dart';


abstract class HomeServiceRepository {
  final Dio dio = Injection.getIt.get<ServiceManager>().dio;
  final logger = Injection.getIt.get<LogManager>().logger;

  Future<Either<List<ResourcesModel>, CustomServiceException>> getResources(int index);

}


