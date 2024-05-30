import 'dart:async';

import 'package:crypto_currencies_test_app/features/coins/domain/usecases/get_coin_assets_usecase.dart';
import 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/blocs/get_paginated_coins_bloc/get_paginated_coins_event.dart';
import 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/blocs/get_paginated_coins_bloc/get_paginated_coins_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

export 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/blocs/get_paginated_coins_bloc/get_paginated_coins_event.dart';
export 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/blocs/get_paginated_coins_bloc/get_paginated_coins_state.dart';

const _maxLimitToGet = 15;

class GetPaginatedCoinsBloc extends Bloc<GetPaginatedCoinsEvent, GetPaginatedCoinsState> {
  final GetCoinAssetsUseCase _getCoinAssetsUseCase;

  GetPaginatedCoinsBloc({
    required GetCoinAssetsUseCase getCoinAssetsUseCase,
  })  : _getCoinAssetsUseCase = getCoinAssetsUseCase,
        super(const GetPaginatedCoinsStateInitial()) {
    on<GetPaginatedCoinsEvent>(_emitters);
  }

  FutureOr<void> _emitters(
    GetPaginatedCoinsEvent event,
    Emitter<GetPaginatedCoinsState> emit,
  ) async =>
      switch (event) {
        FetchPaginatedCoins() => _fetchPaginatedCoins(event, emit),
        PaginatedCoinsFetched() => _addCoins(event, emit),
      };

  FutureOr<void> _fetchPaginatedCoins(
    FetchPaginatedCoins event,
    Emitter<GetPaginatedCoinsState> emit,
  ) async {
    if (state is GetPaginatedCoinsStateLoading) return;

    emit(const GetPaginatedCoinsStateLoading());

    try {
      final paginatedCoins = await _getCoinAssetsUseCase(
        (limit: _maxLimitToGet, offset: event.offset),
      );

      return emit(GetPaginatedCoinsStateSuccess(List.unmodifiable(paginatedCoins)));
    } on Object catch (exception) {
      if (exception is Exception) {
        emit(GetPaginatedCoinsStateFailure(exception));
      }
      rethrow;
    }
  }

  void _addCoins(
    PaginatedCoinsFetched event,
    Emitter<GetPaginatedCoinsState> emit,
  ) {
    final currentState = state;
    if (currentState is GetPaginatedCoinsStateSuccess) {
      return emit(
        GetPaginatedCoinsStateSuccess(
          List.unmodifiable([...currentState.coins, ...event.coins]),
        ),
      );
    } else {
      return;
    }
  }
}
