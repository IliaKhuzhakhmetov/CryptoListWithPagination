import 'package:crypto_currencies_test_app/features/coins/domain/entities/coin_entity.dart';
import 'package:flutter/material.dart';

class CoinItem extends StatelessWidget {
  final TextStyle? textStyle;
  final CoinEntity coinEntity;

  const CoinItem({required this.coinEntity, this.textStyle, super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ?? Theme.of(context).textTheme.bodyLarge;

    return ListTile(
      key: key,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      leading: SizedBox.square(
        dimension: 56,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: coinEntity.backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
        ),
      ),
      trailing: Text(
        coinEntity.formattedPriceUsd,
        style: textStyle,
      ),
      title: Text(
        coinEntity.symbol,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
