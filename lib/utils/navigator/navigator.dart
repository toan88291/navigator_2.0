import 'package:example_navigator_20/data/cubit/navigator/navigator_cubit.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  final List<Page> pages;

  final NaCubit navigatorCubit;

  NavigatorPage({this.navigatorKey,this.pages,this.navigatorCubit});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !await navigatorKey.currentState.maybePop(),
      child: Navigator(
        key: navigatorKey,
        pages: pages,
        onPopPage: (route, result) =>
            _onPopPage(route, result),

        transitionDelegate: const CustomTransitionDelegate(),
      ),
    );
  }

  bool _onPopPage(
      Route<dynamic> route, dynamic result) {
    navigatorCubit.didPop(route.settings, result);
    return route.didPop(result);
  }

}

class CustomTransitionDelegate extends DefaultTransitionDelegate {
  const  CustomTransitionDelegate() : super();

  @override
  Iterable<RouteTransitionRecord> resolve({
    List<RouteTransitionRecord> newPageRouteHistory,
    Map<RouteTransitionRecord, RouteTransitionRecord>
    locationToExitingPageRoute,
    Map<RouteTransitionRecord, List<RouteTransitionRecord>>
    pageRouteToPagelessRoutes,
  }) {
    final results = super.resolve(
      newPageRouteHistory: newPageRouteHistory,
      locationToExitingPageRoute: locationToExitingPageRoute,
      pageRouteToPagelessRoutes: pageRouteToPagelessRoutes,
    );
    return results;
  }
}
