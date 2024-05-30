import 'dart:async';

import 'package:crypto_currencies_test_app/core/base/di/dependency_container.dart';
import 'package:crypto_currencies_test_app/core/base/di/dependency_registrar.dart';
import 'package:crypto_currencies_test_app/core/base/di/service_descriptor.dart';
import 'package:crypto_currencies_test_app/core/base/factories/dio_client_factory.dart';
import 'package:crypto_currencies_test_app/core/constants/constants.dart';
import 'package:crypto_currencies_test_app/features/coins/data/datasources/coins_remote_datasource.dart';
import 'package:crypto_currencies_test_app/features/coins/data/interceptors/coin_cap_auth_interceptor.dart';
import 'package:crypto_currencies_test_app/features/coins/data/mappers/coin_entity_mapper.dart';
import 'package:crypto_currencies_test_app/features/coins/data/repositories/coin_repository_impl.dart';
import 'package:crypto_currencies_test_app/features/coins/domain/repositories/coin_repository.dart';
import 'package:crypto_currencies_test_app/features/coins/domain/usecases/get_coin_assets_usecase.dart';
import 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/blocs/get_paginated_coins_bloc/get_paginated_coins_bloc.dart';
import 'package:crypto_currencies_test_app/features/coins/utils/color_generator.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CoinsDependencyRegistrar implements DependencyRegistrar {
  final DependencyContainer _container;

  const CoinsDependencyRegistrar({
    required DependencyContainer container,
  }) : _container = container;

  @override
  FutureOr<void> register() async {
    // Utils
    _container.register(
      () => CoinColorGenerator(random: _container()),
    );

    // Interceptors
    _container.register(() => CoinCapAuthInterceptor(dotEnv: _container()));

    // DataSources
    _container.register<CoinsRemoteDataSource>(
      () => CoinCapRemoteDataSourceImpl(
        dio: DioClientFactory.create(
          DioFactorySettings(
            baseUrl: AppConstants.coinCapBaseApi,
            interceptors: [
              if (kDebugMode) _container<PrettyDioLogger>(),
              _container<CoinCapAuthInterceptor>(),
            ],
          ),
        ),
      ),
    );

    // Mappers
    _container.register(
      () => CoinEntityMapper(
        colorGenerator: _container<CoinColorGenerator>(),
      ),
    );

    // Repositories
    _container.register<CoinRepository>(
      () => CoinRepositoryImpl(
        coinsRemoteDataSource: _container(),
        coinEntityMapper: _container<CoinEntityMapper>(),
      ),
    );

    // Usecases
    _container.register(() => GetCoinAssetsUseCase(coinRepository: _container()));

    // BLoCs
    _container.register(
      () => GetPaginatedCoinsBloc(
        getCoinAssetsUseCase: _container(),
      ),
      lifeTime: LifeTime.transient,
    );
  }
}
