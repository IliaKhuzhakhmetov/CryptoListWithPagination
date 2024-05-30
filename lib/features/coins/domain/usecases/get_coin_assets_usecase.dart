import 'dart:async';

import 'package:crypto_currencies_test_app/core/base/base_usecase.dart';
import 'package:crypto_currencies_test_app/features/coins/domain/entities/coin_entity.dart';
import 'package:crypto_currencies_test_app/features/coins/domain/repositories/coin_repository.dart';

typedef FetchCoinParams = ({int limit, int offset});

class GetCoinAssetsUseCase implements BaseUseCase<List<CoinEntity>, FetchCoinParams> {
  final CoinRepository _coinRepository;

  GetCoinAssetsUseCase({
    required CoinRepository coinRepository,
  }) : _coinRepository = coinRepository;

  @override
  Future<List<CoinEntity>> call(FetchCoinParams params) {
    return _coinRepository.getCoins(params.limit, params.offset);
  }
}
