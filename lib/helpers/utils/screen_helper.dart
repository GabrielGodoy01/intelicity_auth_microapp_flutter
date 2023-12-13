import 'package:flutter/material.dart';

class ScreenHelper {
  static Size size(BuildContext context) => MediaQuery.of(context).size;
  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) => size(context).height;
  static double breakpointMobile = 600;
  static double breakpointTablet = 1200;

  static bool isMobile(BuildContext context) =>
      width(context) <= breakpointMobile;
  static bool isTablet(BuildContext context) =>
      width(context) < breakpointTablet && width(context) > breakpointMobile;
}
