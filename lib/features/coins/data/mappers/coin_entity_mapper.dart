import 'package:crypto_currencies_test_app/core/base/base_mapper.dart';
import 'package:crypto_currencies_test_app/features/coins/data/models/coin_model.dart';
import 'package:crypto_currencies_test_app/features/coins/domain/entities/coin_entity.dart';
import 'package:crypto_currencies_test_app/features/coins/utils/color_generator.dart';

class CoinEntityMapper implements EntityMapper<CoinEntity, CoinModel> {
  final ColorGenerator _colorGenerator;

  const CoinEntityMapper({required ColorGenerator colorGenerator})
      : _colorGenerator = colorGenerator;

  @override
  CoinEntity toEntity(CoinModel model) {
    return CoinEntity(
      id: model.id,
      rank: model.rank,
      symbol: model.symbol,
      name: model.name,
      supply: model.supply,
      maxSupply: model.maxSupply,
      marketCapUsd: model.marketCapUsd,
      volumeUsd24Hr: model.volumeUsd24Hr,
      priceUsd: model.priceUsd,
      changePercent24Hr: model.changePercent24Hr,
      vwap24Hr: model.vwap24Hr,
      // TODO: Maybe not the best way to do it here, but color generates only one time and then it's cached
      backgroundColor: _colorGenerator.generateRandomColor(),
    );
  }
}
