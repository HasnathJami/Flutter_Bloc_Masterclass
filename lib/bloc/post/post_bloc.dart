import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/post/post_events.dart';
import 'package:flutter_bloc_masterclass/bloc/post/post_states.dart';
import 'package:flutter_bloc_masterclass/repository/post_repository.dart';
import 'package:flutter_bloc_masterclass/utils/enums.dart';

class PostBloc extends Bloc<PostEvents, PostStates> {
  PostRepository postRepository = PostRepository();

  PostBloc() : super(const PostStates()) {
    on<PostFetched>(fetchPostApi);
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
}
