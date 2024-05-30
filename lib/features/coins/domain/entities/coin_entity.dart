import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class CoinEntity extends Equatable {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final double supply;
  final double? maxSupply;
  final double marketCapUsd;
  final double volumeUsd24Hr;
  final double priceUsd;
  final double changePercent24Hr;
  final double? vwap24Hr;

  final Color backgroundColor;

  const CoinEntity({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    this.maxSupply,
    required this.marketCapUsd,
    required this.volumeUsd24Hr,
    required this.priceUsd,
    required this.changePercent24Hr,
    this.vwap24Hr,
    required this.backgroundColor,
  });

  /// Returns the formatted price in USD with a consistent number of decimal places.
  ///
  /// Uses the `NumberFormat` class from the `intl` package to format the
  /// number as a currency string with the desired number of decimal places.
  String get formattedPriceUsd {
    // Determine the number of decimal digits to display
    final decimalDigits = priceUsd >= 1 ? 2 : _calculateDecimalDigits(priceUsd);

    // Create a currency formatter with the dollar symbol and the determined decimal places
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: decimalDigits);

    // Return the formatted price
    return formatter.format(priceUsd);
  }

  /// Calculates the number of decimal digits to display for the price.
  ///
  /// If the price is < 1, it determines the number of decimal digits
  /// dynamically until a significant figure is encountered, up to 8 digits.
  int _calculateDecimalDigits(double value) {
    // Convert the value to string and find the first non-zero digit after the decimal point
    String valueString = value.toString().substring(2); // Skip "0."
    int significantIndex = valueString.indexOf(RegExp(r'[1-9]'));

    // Return the position of the first significant digit, ensuring at least 2 decimal places
    return (significantIndex + 1).clamp(2, 8);
  }

  @override
  List<Object?> get props => [
        id,
        rank,
        symbol,
        name,
        supply,
        maxSupply,
        marketCapUsd,
        volumeUsd24Hr,
        priceUsd,
        changePercent24Hr,
        vwap24Hr,
        backgroundColor,
      ];
}
