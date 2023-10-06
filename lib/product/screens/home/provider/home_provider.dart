import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:voco/feature/models/resources_model.dart';
import 'package:voco/product/screens/home/service/home_service_repository_impl.dart';
import '../../../../feature/injection.dart';

class HomeProvider extends ChangeNotifier {
  final HomeServiceRepositoryImpl _homeService = Injection.getIt.get<HomeServiceRepositoryImpl>();
  static final homeProvider = ChangeNotifierProvider((ref) => HomeProvider());

  bool _fetchData = true;
  bool get fetchData => _fetchData;

  bool _loading = false;
  bool get loading => _loading;

  bool isLastPage = false;
  int pageNumber = 1;

  int _currentPage = 1;
  int get currentPage => _currentPage;

  List<ResourcesModel> _resourcesList = [];
  List<ResourcesModel> get resourcesList => _resourcesList;

  //bu kontroller ile sayfalar arası geçiş yapılabilier
  bool notificationController(ScrollNotification scrollInfo) {
    if (!loading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
      if (isLastPage == true) {
        return false;
      }
      _currentPage = 1 + _currentPage;
      getResources(_currentPage);
      notifyListeners();
    }
    return false;
  }

  //userların provider içerisinde listede tutulması
  void getResources(int currentPage) async {

    _fetchData = false;
    _loading = true;
    notifyListeners();

    final response = await _homeService.getResources(currentPage);
    response.fold(
      (l) => {
        //her sayfada altı kişi geldiği için, gelmediği sayfa son sayfa olur
        if (l.length != 6)
          {
            isLastPage = true,
          }
        else
          {
            pageNumber + 1,
            _resourcesList = l,
          }
      },
      (r) => {},
    );
    _loading = false;
    notifyListeners();
  }
}
