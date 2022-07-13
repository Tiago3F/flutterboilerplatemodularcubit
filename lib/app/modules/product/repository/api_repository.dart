import 'package:flutterboilerplatemodularcubit/app/modules/product/service/api_service.dart';

import '../models/post_model.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository({required this.apiService});

  Future<List<Post>?> getPostList() async {
    final response = await apiService.getPostData();
    print(response);
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (singlePost) => Post.fromMap(singlePost),
          )
          .toList();
    }
  }
}
