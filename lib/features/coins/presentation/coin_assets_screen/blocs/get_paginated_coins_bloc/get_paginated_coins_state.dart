import 'package:crypto_currencies_test_app/features/coins/domain/entities/coin_entity.dart';
import 'package:equatable/equatable.dart';

sealed class GetPaginatedCoinsState {
  const GetPaginatedCoinsState();

  bool get isLoading => this is GetPaginatedCoinsStateLoading;
  List<CoinEntity> get coinsList => switch (this) {
        GetPaginatedCoinsStateLoading() => const [],
        GetPaginatedCoinsStateSuccess(:final coins) => coins.toList(),
        _ => [],
      };
}

class GetPaginatedCoinsStateInitial extends GetPaginatedCoinsState {
  const GetPaginatedCoinsStateInitial();
}

class GetPaginatedCoinsStateLoading extends GetPaginatedCoinsState {
  const GetPaginatedCoinsStateLoading();
}

class GetPaginatedCoinsStateSuccess extends GetPaginatedCoinsState with EquatableMixin {
  final Iterable<CoinEntity> coins;

  const GetPaginatedCoinsStateSuccess(this.coins);

  @override
  List<Object> get props => [coins];
}

class GetPaginatedCoinsStateFailure extends GetPaginatedCoinsState with EquatableMixin {
  final Exception exception;

  const GetPaginatedCoinsStateFailure(this.exception);

  // If we will write test we should override this because every new exception is different
  @override
  List<Object?> get props => [exception.runtimeType, exception.toString()];
}
