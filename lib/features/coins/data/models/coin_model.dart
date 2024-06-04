class CoinModel {
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final double? supply;
  final double? maxSupply;
  final double? marketCapUsd;
  final double? volumeUsd24Hr;
  final double? priceUsd;
  final double? changePercent24Hr;
  final double? vwap24Hr;

  const CoinModel({
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
  });

  factory CoinModel.fromMap(Map<String, dynamic> map) {
    return CoinModel(
      id: map['id'],
      rank: map['rank'],
      symbol: map['symbol'],
      name: map['name'],
      supply: map['supply'] != null ? double.tryParse(map['supply']) : null,
      maxSupply: map['maxSupply'] != null ? double.tryParse(map['maxSupply']) : null,
      marketCapUsd: map['marketCapUsd'] != null ? double.tryParse(map['marketCapUsd']) : null,
      volumeUsd24Hr: map['volumeUsd24Hr'] != null ? double.tryParse(map['volumeUsd24Hr']) : null,
      priceUsd: map['priceUsd'] != null ? double.tryParse(map['priceUsd']) : null,
      changePercent24Hr:
          map['changePercent24Hr'] != null ? double.tryParse(map['changePercent24Hr']) : null,
      vwap24Hr: map['vwap24Hr'] != null ? double.tryParse(map['vwap24Hr']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'rank': rank,
      'symbol': symbol,
      'name': name,
      'supply': supply,
      'maxSupply': maxSupply,
      'marketCapUsd': marketCapUsd,
      'volumeUsd24Hr': volumeUsd24Hr,
      'priceUsd': priceUsd,
      'changePercent24Hr': changePercent24Hr,
      'vwap24Hr': vwap24Hr,
    };
  }
}
