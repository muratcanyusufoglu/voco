import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void snackBar(BuildContext context, String message, String type) async {
  if (type == 'info') {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
      ),
    );
  } else if (type == 'success') {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
      ),
    );
  } else if (type == 'error') {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
      displayDuration: const Duration(seconds: 2),
    );
  }else if (type == 'true') {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: message,
        ),
        displayDuration: const Duration(seconds: 3));
  } else if (type == 'false') {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
        displayDuration: const Duration(seconds: 3));
  } else {
    showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
        displayDuration: const Duration(seconds: 3));
  }
}
