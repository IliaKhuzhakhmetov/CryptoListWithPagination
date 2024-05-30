import 'package:crypto_currencies_test_app/core/base/di/dependency_service.dart';
import 'package:crypto_currencies_test_app/features/coins/domain/entities/coin_entity.dart';
import 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/blocs/get_paginated_coins_bloc/get_paginated_coins_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FooterCoinsPaginatedWidget extends StatelessWidget {
  final int offset;
  final ValueSetter<Exception>? onFailure;
  final ValueSetter<Iterable<CoinEntity>>? onSuccess;

  const FooterCoinsPaginatedWidget({
    required this.offset,
    required this.onSuccess,
    this.onFailure,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dependencyGetter = DependencyService.of(context);

    return BlocProvider<GetPaginatedCoinsBloc>(
      create: (_) => dependencyGetter()..add(FetchPaginatedCoins(offset)),
      child: BlocConsumer<GetPaginatedCoinsBloc, GetPaginatedCoinsState>(
        listener: _getPaginatedCoinsListener,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _getPaginatedCoinsListener(
    BuildContext context,
    GetPaginatedCoinsState state,
  ) {
    switch (state) {
      case GetPaginatedCoinsStateSuccess(:final coins):
        onSuccess?.call(coins);

      case GetPaginatedCoinsStateFailure(:final exception):
        onFailure?.call(exception);

      default:
        break;
    }
  }
}
