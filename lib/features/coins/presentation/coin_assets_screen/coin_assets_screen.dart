import 'package:crypto_currencies_test_app/core/base/di/dependency_service.dart';
import 'package:crypto_currencies_test_app/features/coins/domain/entities/coin_entity.dart';
import 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/blocs/get_paginated_coins_bloc/get_paginated_coins_bloc.dart';
import 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/widgets/coin_item.dart';
import 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/widgets/footer_coins_paginated_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsAssetsScreen extends StatelessWidget {
  const CoinsAssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dependencyGetter = DependencyService.of(context);

    return BlocProvider<GetPaginatedCoinsBloc>(
      create: (_) => dependencyGetter()..add(const FetchPaginatedCoins(0)),
      child: Scaffold(
        body: BlocBuilder<GetPaginatedCoinsBloc, GetPaginatedCoinsState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }

            if (state is GetPaginatedCoinsStateFailure) {
              return Center(
                child: Column(
                  children: [
                    const Text('Oops! Something went wrong'),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => _retryToGetFirstPage(context),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: state.coinsList.length + 1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (index == state.coinsList.length) {
                  // Footer for infinity paginated loading
                  return FooterCoinsPaginatedWidget(
                    offset: state.coinsList.length,
                    onSuccess: (coins) => _addCoinsToList(context, coins),
                  );
                }

                final coin = state.coinsList[index];

                return CoinItem(
                  key: ValueKey(coin.id),
                  coinEntity: coin,
                );
              },
            );
          },
        ),
      ),
    );
  }

  void _retryToGetFirstPage(BuildContext context) {
    context.read<GetPaginatedCoinsBloc>().add(const FetchPaginatedCoins(0));
  }

  void _addCoinsToList(BuildContext context, Iterable<CoinEntity> coins) {
    context.read<GetPaginatedCoinsBloc>().add(PaginatedCoinsFetched(coins));
  }
}
