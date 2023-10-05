// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum APPColors { Main, Secondary, Accent }

extension APPColorsExtension on APPColors {
  Color get orange {
    switch (this) {
      case APPColors.Main:
        return const Color.fromARGB(255, 23, 157, 224);
      case APPColors.Secondary:
        return const Color(0xffF9BA59);
      case APPColors.Accent:
        return const Color(0xffFFCC7E);
      default:
        return const Color(0xffF9AA33);
    }
  }

  Color get green {
    switch (this) {
      case APPColors.Main:
        return const Color(0xff80ed99);
      case APPColors.Secondary:
        return const Color(0xff38b000);
      case APPColors.Accent:
        return const Color(0xffFFCC7E);
      default:
        return Colors.green;
    }
  }

  Color get blue {
    switch (this) {
      case APPColors.Main:
        return const Color.fromARGB(255, 48, 105, 211); //0xff1c5794
      case APPColors.Secondary:
        return const Color(0xffA5E5FF);
      case APPColors.Accent:
        return const Color(0xff184888);
      default:
        return const Color(0xff4a6572);
    }
  }

  Color get grey {
    switch (this) {
      case APPColors.Main:
        return const Color(0xffABABAB);
      case APPColors.Secondary:
        return const Color(0xFF776E6E);
      case APPColors.Accent:
        return const Color.fromARGB(140, 255, 255, 255);
      default:
        return const Color(0xffABABAB);
    }
  }

  Color get black {
    switch (this) {
      case APPColors.Main:
        return const Color(0xff515151);
      case APPColors.Secondary:
        return const Color(0xFF242D31);
      case APPColors.Accent:
        return const Color(0xDD4F5D6B);
      default:
        return const Color(0xff515151);
    }
  }

  Color get white {
    switch (this) {
      case APPColors.Main:
        return const Color(0xffFFFDFD);
      case APPColors.Secondary:
        return const Color(0xffedede9);
      default:
        return const Color(0xffFFFDFD);
    }
  }

  Color get red {
    switch (this) {
      case APPColors.Main:
        return Colors.redAccent;
      case APPColors.Secondary:
        return const Color(0xfff55138);
      default:
        return Colors.red;
    }
  }
}
