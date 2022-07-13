import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterboilerplatemodularcubit/app/modules/product/models/failure_model.dart';
import 'package:flutterboilerplatemodularcubit/app/modules/product/repository/api_repository.dart';
import 'package:meta/meta.dart';

import '../models/post_model.dart';

part 'post_fetch_cubit_state.dart';

class PostFetchCubit extends Cubit<PostFetchCubitState> {
  final ApiRepository apiRepository;

  PostFetchCubit({required this.apiRepository}) : super(PostFetchInitial());

  Future<void> fetchPostApi() async {
    emit(PostFetchLoading());
    try {
      final List<Post>? postList = await apiRepository.getPostList();
      emit(PostFetchLoaded(postList: postList ?? []));
    } on Failure catch (e) {
      emit(PostFetchError(failure: e));
    } catch (e) {
      print("Error: $e");
    }
  }
}
