import 'package:flutter/material.dart';

class FadeInRoute extends PageRouteBuilder {
  final Widget page;
  final bool opaqueVal;

  FadeInRoute({required this.page, this.opaqueVal = true})
      : super(
          opaque: opaqueVal,
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (
            BuildContext _,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
}
