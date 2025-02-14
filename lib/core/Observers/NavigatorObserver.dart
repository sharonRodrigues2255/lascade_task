import 'package:flutter/material.dart';
import 'dart:developer';

class NavigatorObservers extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRouteDetails('PUSH', route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRouteDetails('POP', route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRouteDetails('REMOVE', route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _logRouteReplacement(newRoute, oldRoute);
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logUserGesture('START', route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    log('User gesture stopped', name: 'NavigatorObserver');
  }

  void _logRouteDetails(
      String action, Route<dynamic> route, Route<dynamic>? previousRoute) {
    final routeName = route.settings.name ?? 'Unnamed Route';
    final previousRouteName = previousRoute?.settings.name ?? 'None';
    final arguments = route.settings.arguments;

    log(
      'Action: $action\n'
      'Current Route: $routeName\n'
      'Previous Route: $previousRouteName\n'
      'Arguments: ${arguments != null ? arguments.toString() : 'None'}',
      name: 'NavigatorObserver',
    );
  }

  void _logRouteReplacement(
      Route<dynamic>? newRoute, Route<dynamic>? oldRoute) {
    final newRouteName = newRoute?.settings.name ?? 'Unnamed Route';
    final oldRouteName = oldRoute?.settings.name ?? 'Unnamed Route';

    log(
      'Route Replacement:\n'
      'Old Route: $oldRouteName\n'
      'New Route: $newRouteName',
      name: 'NavigatorObserver',
    );
  }

  void _logUserGesture(
      String action, Route<dynamic> route, Route<dynamic>? previousRoute) {
    final routeName = route.settings.name ?? 'Unnamed Route';
    final previousRouteName = previousRoute?.settings.name ?? 'None';

    log(
      'User Gesture $action:\n'
      'Current Route: $routeName\n'
      'Previous Route: $previousRouteName',
      name: 'NavigatorObserver',
    );
  }
}
