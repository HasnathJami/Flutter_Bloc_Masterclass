import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_masterclass/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  Future<List<PostModel>?> fetchPost() async {
    try {
      final response = await http.get(
          Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"));
      if (response.statusCode == 200) {
        // final body = json.decode(response.body) as List<PostModel>;
        // return body;
        //  var data = PostModel.fromJson(json.decode(response.body));
        final body = json.decode(response.body) as List;
        return body.map(( dynamic value) => PostModel(
              id: value['id'] as int,
              postId: value['postId'] as int,
              email: value['email'] as String,
              body: value['body'] as String)).toList();
      } else {
        return null;
      }
    } on SocketException {
      throw Exception('error while fetching data');
    } on TimeoutException {
      throw Exception('error while fetching data');
    }
  }
}
