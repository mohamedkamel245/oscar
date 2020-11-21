

import 'package:flutter/material.dart';

class FadeRouteBuilder<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeRouteBuilder({@required this.page})
      : super(
    pageBuilder: (context, animation1, animation2) => page,
    transitionsBuilder: (context, animation1, animation2, child) {
      return FadeTransition(opacity: animation1, child: child);
    },
  );
}
class SlideFromBottomPageRoute extends PageRouteBuilder {
  final Widget widget;

  SlideFromBottomPageRoute({this.widget}) : super(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 1.0),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0, 1.0),
            ).animate(secondaryAnimation),
            child: child,
          ),
        );
      }
  );
}
class SlideFromLeftPageRoute extends PageRouteBuilder {
  Widget widget;

  SlideFromLeftPageRoute({this.widget}) : super(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-1.0, 0.0),
          ).animate(secondaryAnimation),
          child: child,
        ),
      );
    },
  );
}
class SlideFromRightPageRoute extends PageRouteBuilder {
  final Widget widget;
  SlideFromRightPageRoute({this.widget}) : super(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(1.0, 0.0),
            ).animate(secondaryAnimation),
            child: child,
          ),
        );
      }
  );
}


class CustomMaterialPageRoute extends MaterialPageRoute {
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }
  CustomMaterialPageRoute({@required WidgetBuilder builder, RouteSettings settings, bool maintainState = true, bool fullscreenDialog = false,}) : super(

    builder: builder,
    settings: settings,
    maintainState: maintainState,
    fullscreenDialog: fullscreenDialog,
  );
}


class SlideFromTopRoute extends PageRouteBuilder {
  final Widget widget;

  SlideFromTopRoute({this.widget}) : super(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -1.0),
            end: Offset.zero,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset.zero,
              end: const Offset(0.0, -1.0),
            ).animate(secondaryAnimation),
            child: child,
          ),
        );
      }
  );
}