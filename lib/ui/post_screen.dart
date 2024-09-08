import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/post/post_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/post/post_events.dart';
import 'package:flutter_bloc_masterclass/bloc/post/post_states.dart';
import 'package:flutter_bloc_masterclass/model/posts_model.dart';
import 'package:flutter_bloc_masterclass/utils/enums.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();

    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts API's'"),
      ),
      body: BlocBuilder<PostBloc, PostStates>(builder: (context, state) {
        switch (state.postStatus) {
          case PostStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case PostStatus.success:
            return Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Search with email',
                      border: OutlineInputBorder()),
                  onChanged: (filterKey) {
                    context.read<PostBloc>().add(SearchItem(filterKey));
                  },
                ),
                Expanded(
                  child: state.searchMessage.isNotEmpty
                      ? Center(child: Text(state.searchMessage.toString()))
                      : ListView.builder(
                          itemCount: state.tempPostList.isEmpty
                              ? state.postList.length
                              : state.tempPostList.length,
                          itemBuilder: (context, index) {
                            PostModel? item;
                            if (state.tempPostList.isNotEmpty) {
                              item = state.tempPostList[index];
                            } else {
                              item = state.postList[index];
                            }
                            return ListTile(
                              title: Text(item.email.toString()),
                              subtitle: Text(item.body.toString()),
                            );
                          }),
                ),
              ],
            );
          case PostStatus.failure:
            return Center(child: Text(state.message.toString()));
        }
      }),
    );
  }
}
