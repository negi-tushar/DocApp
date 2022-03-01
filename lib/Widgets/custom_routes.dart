import 'package:flutter/cupertino.dart';

class CustomRoutes extends PageRouteBuilder {
  final Widget child;
  final String args;
  CustomRoutes({required this.child, required this.args})
      : super(
            settings: RouteSettings(
              arguments: args,
            ),
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (context, animation, secondAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
}
