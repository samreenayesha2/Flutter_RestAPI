import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post_model.dart';

class PostRepository {
  static Future<List<PostModel>> getPosts() async {
    const postURL = "https://jsonplaceholder.typicode.com/posts";
    List<PostModel> _postLists = [];
    try {
      final response = await http.get(Uri.parse(postURL));

      if (response.statusCode == 200) {
        debugPrint("response is successfull");
        List responseBody = jsonDecode(response.body);
        for (Map i in responseBody) {
          PostModel postModel = PostModel(
              userId: i["userId"],
              id: i["id"],
              postTitle: i["title"],
              postBody: i["body"]);

          _postLists.add(postModel);
        }
        log(_postLists[1].postTitle.toString());
      } else {
        debugPrint(
            "something went wrong with api..........................................................");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return _postLists;
  }
}
