import 'package:menu_app/reducers/actions.dart';
import 'package:menu_app/states/state.dart';

postsReducer(PostsState prevState, SetPostsStateAction action) {
  final payload = action.postsState;
  return prevState.copyWith(
    isError: payload.isError,
    isLoading: payload.isLoading,
    posts: payload.posts,
  );
}
