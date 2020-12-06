import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:menu_app/models/category_model.dart';
import 'package:menu_app/reducers/store.dart';
import 'package:menu_app/states/state.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

@immutable
class SetPostsStateAction {
  final PostsState postsState;

  SetPostsStateAction(this.postsState);
}

Future<void> fetchPostsAction(Store<AppState> store) async {
  store.dispatch(SetPostsStateAction(PostsState(isLoading: true)));

  try {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts');
    assert(response.statusCode == 200);
    final jsonData = json.decode(response.body);
    log('data: $jsonData');
    store.dispatch(
      SetPostsStateAction(
        PostsState(
          isLoading: false,
          posts: ICModel.listFromJson(jsonData),
        ),
      ),
    );
  } catch (error) {
    store.dispatch(SetPostsStateAction(PostsState(isLoading: false)));
  }
}
