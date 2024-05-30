import 'dart:async';
import 'dart:math';

import 'package:crypto_currencies_test_app/core/base/di/dependency_container.dart';
import 'package:crypto_currencies_test_app/core/base/di/dependency_registrar.dart';
import 'package:crypto_currencies_test_app/features/coins/registrar/coins_dependency_registrar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class AppDependencyRegistrar with DependencyGetter implements DependencyRegistrar {
  final DependencyContainer _container;

  const AppDependencyRegistrar({
    required DependencyContainer container,
  }) : _container = container;

  @override
  FutureOr<void> register() async {
    final dotenv = DotEnv();
    await dotenv.load();

    _container.register(() => dotenv);

    _container.register(() => PrettyDioLogger());

    _container.register(() => Random());

    final registrars = [
      CoinsDependencyRegistrar(container: _container),
    ];

    for (final registrar in registrars) {
      registrar.register();
    }
  }

  @override
  TypeToGet call<TypeToGet>() => _container<TypeToGet>();
}
