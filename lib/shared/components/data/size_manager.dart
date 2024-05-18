import 'package:flutter/material.dart';

class AppMargin {
  static const double m4 = 4;
  static const double m12 = 12;
  static const double m14 = 14;
  static const double m18 = 18;
  static const double m20 = 20;
  static const double m22 = 22;
  static const double m30 = 30;
  static const double m40 = 40;
  static const double m50 = 50;
  static const double m75 = 75;
}

class AppPadding {
  static const double p1_5 = 1.5;
  static const double p2 = 2;
  static const double p4 = 4;
  static const double p8 = 8;
  static const double p12 = 12;
  static const double p14 = 14;
  static const double p16 = 16;
  static const double p18 = 18;
  static const double p20 = 20;
  static const double p22 = 22;
  static const double p25 = 25;
  static const double p28 = 28;
  static const double p30 = 30;
  static const double p40 = 40;
  static const double p50 = 50;
  static const double p75 = 75;
}

class AppSize {
  static const double s0 = 0;
  static const double s0_5 = 0.5;
  static const double s1 = 1;
  static const double s1_5 = 1.5;
  static const double s2 = 2;
  static const double s4 = 4;
  static const double s5 = 4;
  static const double s6 = 4;
  static const double s8 = 8;
  static const double s10 = 10;
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s22 = 22;
  static const double s25 = 25;
  static const double s30 = 30;
  static const double s37 = 37;
  static const double s40 = 40;
  static const double s45 = 45;
  static const double s48 = 48;
  static const double s50 = 50;
  static const double s52 = 52;
  static const double s55 = 55;
  static const double s60 = 60;
  static const double s64 = 64;
  static const double s70 = 70;
  static const double s75 = 75;
  static const double s80 = 80;
  static const double s85 = 85;
  static const double s90 = 90;
  static const double s96 = 96;
  static const double s100 = 100;
  static const double s135 = 135;
  static const double s150 = 150;
  static const double s160 = 160;
  static const double s175 = 175;
  static const double s200 = 200;
  static const double s240 = 240;
  static const double s250 = 250;
  static const double s300 = 300;
  static const double s350 = 350;
  static const double s400 = 400;
  static const double s450 = 450;
  static const double s500 = 500;
  static const double s526 = 526;


  final double Function(double percent) withHeight;
  final double Function(double percent) withWidth;

  final double h0;
  final double h2;
  final double h3;
  final double h4;
  final double h5;
  final double h6;
  final double h8;
  final double h10;
  final double h12;
  final double h14;
  final double h16;
  final double h18;
  final double h20;
  final double h22;
  final double h30;
  final double h33;
  final double h40;
  final double h43;
  final double h45;
  final double h48;
  final double h50;
  final double h52;
  final double h60;
  final double h64;
  final double h70;
  final double h75;
  final double h80;
  final double h85;
  final double h90;
  final double h92;
  final double h96;
  final double h100;
  final double h200;

  final double w0;
  final double w2;
  final double w3;
  final double w4;
  final double w5;
  final double w6;
  final double w8;
  final double w10;
  final double w12;
  final double w14;
  final double w16;
  final double w18;
  final double w20;
  final double w22;
  final double w30;
  final double w33;
  final double w40;
  final double w43;
  final double w45;
  final double w48;
  final double w50;
  final double w52;
  final double w60;
  final double w64;
  final double w70;
  final double w75;
  final double w80;
  final double w85;
  final double w90;
  final double w92;
  final double w96;
  final double w100;
  final double w200;

  AppSize({
    required this.withHeight,
    required this.withWidth,
    required this.h0,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.h6,
    required this.h8,
    required this.h10,
    required this.h12,
    required this.h14,
    required this.h16,
    required this.h18,
    required this.h20,
    required this.h22,
    required this.h30,
    required this.h33,
    required this.h40,
    required this.h43,
    required this.h45,
    required this.h48,
    required this.h50,
    required this.h52,
    required this.h60,
    required this.h64,
    required this.h70,
    required this.h75,
    required this.h80,
    required this.h85,
    required this.h90,
    required this.h92,
    required this.h96,
    required this.h100,
    required this.h200,
    required this.w0,
    required this.w2,
    required this.w3,
    required this.w4,
    required this.w5,
    required this.w6,
    required this.w8,
    required this.w10,
    required this.w12,
    required this.w14,
    required this.w16,
    required this.w18,
    required this.w20,
    required this.w22,
    required this.w30,
    required this.w33,
    required this.w40,
    required this.w43,
    required this.w45,
    required this.w48,
    required this.w50,
    required this.w52,
    required this.w60,
    required this.w64,
    required this.w70,
    required this.w75,
    required this.w80,
    required this.w85,
    required this.w90,
    required this.w92,
    required this.w96,
    required this.w100,
    required this.w200,
  });

  static double _withHeight(double percent, double height) {
    return (height / 100) * percent;
  }

  static double _withWidth(double percent, double width) {
    return (width / 100) * percent;
  }

  factory AppSize.of(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    final double w = MediaQuery.of(context).size.width;

    return AppSize(
      withHeight: (double percent) => _withHeight(percent, h),
      withWidth: (double percent) => _withWidth(percent, h),
      h0: _withHeight(0, h),
      h2: _withHeight(2, h),
      h3: _withHeight(3, h),
      h4: _withHeight(4, h),
      h5: _withHeight(5, h),
      h6: _withHeight(6, h),
      h8: _withHeight(8, h),
      h10: _withHeight(10, h),
      h12: _withHeight(12, h),
      h14: _withHeight(14, h),
      h16: _withHeight(16, h),
      h18: _withHeight(18, h),
      h20: _withHeight(20, h),
      h22: _withHeight(22, h),
      h30: _withHeight(30, h),
      h33: _withHeight(33, h),
      h40: _withHeight(40, h),
      h43: _withHeight(40, h),
      h45: _withHeight(45, h),
      h48: _withHeight(48, h),
      h50: _withHeight(50, h),
      h52: _withHeight(52, h),
      h60: _withHeight(60, h),
      h64: _withHeight(64, h),
      h70: _withHeight(70, h),
      h75: _withHeight(75, h),
      h80: _withHeight(80, h),
      h85: _withHeight(85, h),
      h90: _withHeight(90, h),
      h92: _withHeight(92, h),
      h96: _withHeight(96, h),
      h100: _withHeight(100, h),
      h200: _withHeight(200, h),
      
      w0: _withWidth(0, w),
      w2: _withWidth(2, w),
      w3: _withWidth(3, w),
      w4: _withWidth(4, w),
      w5: _withWidth(5, w),
      w6: _withWidth(6, w),
      w8: _withWidth(8, w),
      w10: _withWidth(10, w),
      w12: _withWidth(12, w),
      w14: _withWidth(14, w),
      w16: _withWidth(16, w),
      w18: _withWidth(18, w),
      w20: _withWidth(20, w),
      w22: _withWidth(22, w),
      w30: _withWidth(30, w),
      w33: _withWidth(33, w),
      w40: _withWidth(40, w),
      w43: _withWidth(43, w),
      w45: _withWidth(45, w),
      w48: _withWidth(48, w),
      w50: _withWidth(50, w),
      w52: _withWidth(52, w),
      w60: _withWidth(60, w),
      w64: _withWidth(64, w),
      w70: _withWidth(70, w),
      w75: _withWidth(75, w),
      w80: _withWidth(80, w),
      w85: _withWidth(85, w),
      w90: _withWidth(90, w),
      w92: _withWidth(92, w),
      w96: _withWidth(96, w),
      w100: _withWidth(100, w),
      w200: _withWidth(200, w),
    );
  }
}
