import 'package:flutter/material.dart';

class CustomServiceException implements Exception {
  final String message;
  final String statusCode;

  CustomServiceException({required this.message, required this.statusCode});

  @override
  String toString() {
    return message;
  }
}

@immutable
class CustomServiceMessages {
  const CustomServiceMessages._();

  // work space
  static const String work = 'Error while fetching workspaces';

  // login
  static const String loginError = 'Error while logging in';
  static const String tokenChangeError = 'Error while checking token';
  static const String logoutError = 'Error while logging out';

  // work order
  static const String workOrderWorkloadError = 'Error while fetching workload';
  static const String workOrderAttachmentsError = 'Error while fetching attachments';
  static const String workOrderResourcesError = 'Error while fetching resources';
  static const String workOrderShiftingsError = 'Error while fetching shiftings';
  static const String workOrderDetailsError = 'Error while fetching details';
  static const String workOrderSparepartsError = 'Error while fetching spareparts';
  static const String workOrderDateActionError = 'Error while fetching date action';
  static const String workOrderStoresError = 'Error while fetching stores';
  static const String workOrderAddedResourcesError = 'Error while fetching added resources';
  static const String workOrderAddEffortError = 'Error while adding effort';
  static const String workOrderAddPersonalError = 'Error while adding personal';
  static const String workOrderAddImageError = 'Error while adding image';
  static const String workOrderAddSparepartsError = 'Error while adding spareparts';
  static const String workOrderDeleteSparepartsError = 'Error while deleting spareparts';
  static const String workOrderDeletePersonalError = 'Error while deleting personal';
  static const String workOrderDeleteEffortError = 'Error while deleting effort';

  static const String noInternetConnection = "No internet connection";

  // home page
  static const String announcementViewError = 'Error while fetching Announcements';
}
