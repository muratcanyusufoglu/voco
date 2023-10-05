import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco/feature/constants/database/shared_manager.dart';
import 'package:voco/feature/constants/enums/shared_enums.dart';
import 'package:voco/feature/models/login_model.dart';
import 'package:voco/feature/models/resources_model.dart';
import 'package:voco/product/screens/home/service/home_service_repository_impl.dart';

import '../../../../feature/components/snackBar/snackbar.dart';
import '../../../../feature/injection.dart';

class HomeProvider extends ChangeNotifier {
  final HomeServiceRepositoryImpl _homeService = Injection.getIt.get<HomeServiceRepositoryImpl>();
  static final homeProvider = ChangeNotifierProvider((_) => HomeProvider());

  bool fetchData = true;

  bool _loading = false;
  bool get loading => _loading;

  List<ResourcesModel> _resourcesList = [];
  List<ResourcesModel> get resourcesList => _resourcesList;

  void getResources() async {
    fetchData = false;
    _loading = true;
    notifyListeners();
    final response = await _homeService.getResources();
    response.fold(
      (l) => {
        _resourcesList = l,
      },
      (r) => {},
    );
    _loading = false;
    notifyListeners();
  }
}
