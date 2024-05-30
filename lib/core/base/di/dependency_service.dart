import 'package:crypto_currencies_test_app/core/base/di/dependency_registrar.dart';
import 'package:flutter/widgets.dart';

class DependencyService extends InheritedWidget {
  final DependencyGetter _dependencyGetter;

  const DependencyService({
    super.key,
    required DependencyGetter appDependencies,
    required super.child,
  }) : _dependencyGetter = appDependencies;

  static DependencyGetter of(BuildContext context) {
    final dependencyService = context.dependOnInheritedWidgetOfExactType<DependencyService>();
    assert(dependencyService != null, 'No DependencyService found in context');
    return dependencyService!._dependencyGetter;
  }

  @override
  bool updateShouldNotify(DependencyService oldWidget) {
    return _dependencyGetter != oldWidget._dependencyGetter;
  }
}
