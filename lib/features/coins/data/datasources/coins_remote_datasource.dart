import 'package:crypto_currencies_test_app/features/coins/data/models/coin_model.dart';
import 'package:crypto_currencies_test_app/features/coins/data/models/coins_model.dart';
import 'package:dio/dio.dart';

abstract class CoinsRemoteDataSource {
  Future<List<CoinModel>> fetchCoins(
    int? limit,
    int? offset,
  );
}

class CoinCapRemoteDataSourceImpl implements CoinsRemoteDataSource {
  final Dio _dio;

  const CoinCapRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<CoinModel>> fetchCoins(
    int? limit,
    int? offset,
  ) async {
    final response = await _dio.get(
      '/v2/assets',
      queryParameters: {
        'limit': limit,
        'offset': offset,
      },
    );

    if (response.statusCode == 200) {
      final data = response.data;
      if (data != null &&
          data['data'] != null &&
          data['data'] is List &&
          (data['data'] as List).isNotEmpty) {
        return CoinsModel.fromMap(data).data;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load coins');
    }
  }
}
