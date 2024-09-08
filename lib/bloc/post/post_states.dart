import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_masterclass/model/posts_model.dart';
import 'package:flutter_bloc_masterclass/utils/enums.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  final String message;
  final String searchMessage;

  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel>[],
    this.message = '',
    this.searchMessage = '',
  });

  PostStates copyWith(
      {PostStatus? postStatus,
      List<PostModel>? postList,
      String? message,
      String? searchMessage,
      List<PostModel>? tempPostList}) {
    return PostStates(
        postStatus: postStatus ?? this.postStatus,
        postList: postList ?? this.postList,
        tempPostList: tempPostList ?? this.tempPostList,
        message: message ?? this.message,
        searchMessage: searchMessage ?? this.searchMessage);
  }

  @override
  List<Object?> get props =>
      [postStatus, postList, tempPostList, message, searchMessage];
}
