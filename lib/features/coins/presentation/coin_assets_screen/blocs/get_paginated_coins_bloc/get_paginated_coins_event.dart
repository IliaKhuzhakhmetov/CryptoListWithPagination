import 'package:crypto_currencies_test_app/features/coins/domain/entities/coin_entity.dart';

sealed class GetPaginatedCoinsEvent {
  const GetPaginatedCoinsEvent();
}

class FetchPaginatedCoins implements GetPaginatedCoinsEvent {
  final int offset;

  const FetchPaginatedCoins(this.offset);
}

class PaginatedCoinsFetched implements GetPaginatedCoinsEvent {
  final Iterable<CoinEntity> coins;

  const PaginatedCoinsFetched(this.coins);
}
