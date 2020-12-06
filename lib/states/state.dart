import 'package:menu_app/models/category_model.dart';
import 'package:meta/meta.dart';

@immutable
class PostsState {
  final bool isError;
  final bool isLoading;
  final List<ICModel> posts;

  PostsState({
    this.isError,
    this.isLoading,
    this.posts,
  });

  factory PostsState.initial() => PostsState(
        isLoading: false,
        isError: false,
        posts: const [],
      );

  PostsState copyWith({
    @required bool isError,
    @required bool isLoading,
    @required List<ICModel> posts,
  }) {
    return PostsState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      posts: posts ?? this.posts,
    );
  }
}
