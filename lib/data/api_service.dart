import 'package:dio/dio.dart';
import 'recipe_model.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/search.php';

  Future<List<RecipeModel>> fetchRecipes({
    String? search,
    String firstLetter = 'a',
  }) async {
    try {
      final searchQuery = search?.trim();
      final response = await _dio.get(
        _baseUrl,
        queryParameters: searchQuery != null && searchQuery.isNotEmpty
            ? {'s': searchQuery}
            : {'f': firstLetter},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data['meals'] != null) {
          final List meals = data['meals'];
          return meals.map((json) => RecipeModel.fromJson(json)).toList();
        }
        return [];
      } else {
        throw Exception(
          'Gagal mengambil data dari server (${response.statusCode})',
        );
      }
    } on DioException catch (e) {
      throw Exception('Koneksi Dio Bermasalah: ${e.message}');
    } catch (e) {
      throw Exception('Error Tidak Terduga: $e');
    }
  }
}
