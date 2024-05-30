import 'package:crypto_currencies_test_app/features/coins/domain/entities/coin_entity.dart';

abstract interface class CoinRepository {
  Future<List<CoinEntity>> getCoins(int? limit, int? offset);
}
