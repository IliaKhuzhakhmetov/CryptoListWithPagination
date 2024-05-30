import 'package:crypto_currencies_test_app/features/coins/data/models/coin_model.dart';

class CoinsModel {
  final List<CoinModel> data;

  const CoinsModel({required this.data});

  factory CoinsModel.fromMap(Map<String, dynamic> map) {
    return CoinsModel(
      data: List<CoinModel>.from(map['data']?.map((x) => CoinModel.fromMap(x))),
    );
  }
}
