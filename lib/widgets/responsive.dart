import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key key,
    @required this.mobile,
    @required this.tablet,
    @required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600.95;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 450 &&
      MediaQuery.of(context).size.width < 601;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 601;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        if (maxWidth >= 601) {
          return desktop;
        } else if (maxWidth >= 600.95) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
