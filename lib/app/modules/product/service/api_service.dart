import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response?> getPostData() async {
    try {
      final Response response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      return response;
    } catch (e) {
      print("Error :$e");
    }
    return null;
  }
}
