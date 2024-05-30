import 'package:crypto_currencies_test_app/core/base/base_mapper.dart';
import 'package:crypto_currencies_test_app/features/coins/data/datasources/coins_remote_datasource.dart';
import 'package:crypto_currencies_test_app/features/coins/data/models/coin_model.dart';
import 'package:crypto_currencies_test_app/features/coins/domain/entities/coin_entity.dart';
import 'package:crypto_currencies_test_app/features/coins/domain/repositories/coin_repository.dart';

class CoinRepositoryImpl implements CoinRepository {
  final CoinsRemoteDataSource _coinsRemoteDataSource;
  final EntityMapper<CoinEntity, CoinModel> _coinEntityMapper;

  const CoinRepositoryImpl({
    required CoinsRemoteDataSource coinsRemoteDataSource,
    required EntityMapper<CoinEntity, CoinModel> coinEntityMapper,
  })  : _coinsRemoteDataSource = coinsRemoteDataSource,
        _coinEntityMapper = coinEntityMapper;

  @override
  Future<List<CoinEntity>> getCoins(
    int? limit,
    int? offset,
  ) async {
    final result = await _coinsRemoteDataSource.fetchCoins(limit, offset);

    return result.map(_coinEntityMapper.toEntity).toList();
  }
}
