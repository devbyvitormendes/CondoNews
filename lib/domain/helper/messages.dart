import 'package:condo_news/presenter/ui/condo_news_icon.dart';
import 'package:condo_news/presenter/ui/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

sealed class Messages {

  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        backgroundColor: ColorsConstants.black,
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorsConstants.white,
          fontWeight: FontWeight.w900,
        ),
        message: message,
        icon: const Icon(
          CondoNewsIcon.error,
          size: 120,
          color: ColorsConstants.white,
        ),
      ),
    );
  }

  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: ColorsConstants.black,
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorsConstants.white,
          fontWeight: FontWeight.w900,
        ),
        message: message,
        icon: const Icon(
          CondoNewsIcon.info,
          size: 120,
          color: ColorsConstants.white,
        ),
      ),
    );
  }

  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        backgroundColor: ColorsConstants.black,
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorsConstants.white,
          fontWeight: FontWeight.w900,
        ),
        message: message,
        icon: const Icon(
          CondoNewsIcon.success,
          size: 120,
          color: ColorsConstants.white,
        ),
      ),
    );
  }

  static void showWarning(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        backgroundColor: ColorsConstants.black,
        textStyle: const TextStyle(
          fontSize: 16,
          color: ColorsConstants.white,
          fontWeight: FontWeight.w900,
        ),
        message: message,
        iconRotationAngle: 20,
        iconPositionTop: -20,
        icon: const Icon(
          CondoNewsIcon.warning,
          size: 120,
          color: ColorsConstants.white,
        ),
      ),
    );
  }

}