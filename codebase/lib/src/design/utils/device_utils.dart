import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DeviceUtils {
  static double getResponsiveValue(
    BuildContext context, {
    required double mobileValue,
    required double tabletValue,
    required double desktopValue,
  }) {
    return ResponsiveBreakpoints.of(context).isMobile
        ? mobileValue
        : ResponsiveBreakpoints.of(context).isTablet
            ? tabletValue
            : desktopValue;
  }
}
