import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/post/post_events.dart';
import 'package:flutter_bloc_masterclass/bloc/post/post_states.dart';
import 'package:flutter_bloc_masterclass/model/posts_model.dart';
import 'package:flutter_bloc_masterclass/repository/post_repository.dart';
import 'package:flutter_bloc_masterclass/utils/enums.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  List<PostModel> tempPostList = [];

  PostRepository postRepository = PostRepository();

  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_filterList);
  }

  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(state.copyWith(
          postStatus: PostStatus.success, message: 'success', postList: value));
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }

  void _filterList(SearchItem event, Emitter<PostStates> emit) async {
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(tempPostList: [], searchMessage: ''));
    } else {
      // tempPostList = state.postList.where((element) => element.id.toString() == event.stSearch.toString()).toList();
      // tempPostList = state.postList.where((element) => element.email.toString() == event.stSearch.toString()).toList();
      tempPostList = state.postList.where((element) => element.email.toString().toLowerCase().contains(event.stSearch.toString().toLowerCase())).toList();

      if (tempPostList.isEmpty) {
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: 'No data found'));
      } else {
        emit(state.copyWith(tempPostList: tempPostList, searchMessage: ''));
      }
    }
  }
}
