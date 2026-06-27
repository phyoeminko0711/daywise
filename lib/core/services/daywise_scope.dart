import 'package:daywise/core/services/app_state.dart';
import 'package:flutter/widgets.dart';

class DayWiseScope extends InheritedNotifier<AppState> {
  const DayWiseScope({
    super.key,
    required AppState notifier,
    required super.child,
  }) : super(notifier: notifier);

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<DayWiseScope>();
    assert(scope != null, 'DayWiseScope not found in widget tree.');
    return scope!.notifier!;
  }
}
