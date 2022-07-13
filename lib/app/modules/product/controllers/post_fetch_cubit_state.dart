part of 'post_fetch_cubit.dart';

@immutable
abstract class PostFetchCubitState extends Equatable {
  const PostFetchCubitState();
  @override
  List<Object> get props => [];
}

class PostFetchInitial extends PostFetchCubitState {}

class PostFetchLoading extends PostFetchCubitState {}

class PostFetchLoaded extends PostFetchCubitState {
  final List<Post> postList;

  const PostFetchLoaded({required this.postList});

  @override
  List<Object> get props => [postList];
}

class PostFetchError extends PostFetchCubitState {
  final Failure failure;

  const PostFetchError({required this.failure});

  @override
  List<Object> get props => [failure];
}
