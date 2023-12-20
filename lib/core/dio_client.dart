
import 'package:dio/dio.dart';
import 'package:first_bus/core/constans.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  final Dio _dio;

  Dio get dio => _dio;  

  factory ApiService( ) {
    _instance._dio.options.baseUrl = base;
    return _instance;
  }

  ApiService._internal() : _dio = Dio();

  // Rest of the class implementation...
}
