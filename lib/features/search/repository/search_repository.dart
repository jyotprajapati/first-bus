import 'package:dio/dio.dart';
import 'package:first_bus/core/dio_client.dart';
import 'package:first_bus/features/search/repository/search_result.dart';

class SearchRepository{
  final Dio _dio = ApiService().dio;
 
  Future<List<Bus>> search({
    required String fromCityId,
    required String toCityId,
    required String journeyDate,
    required String providerCode,
  }) async {
    try {
      final response = await _dio.get(
        '/v1/search',
        queryParameters: {
          'from_city_id': fromCityId,
          'to_city_id': toCityId,
          'journey_date': journeyDate,
          'providerCode': providerCode,
        },
      );
      final results = response.data['data']['Buses']  as List;
      return results.map((json) => Bus.fromJson(json)).toList();
    } catch (error) {
      // Handle error as needed
      print('Error: $error');
      rethrow;
    }
  }
}