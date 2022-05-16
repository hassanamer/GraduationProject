import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../models/post.dart';


List<Post> parsePost(String responseBody)
{
  var list = json.decode(responseBody) as List<dynamic>;
  var posts = list.map((model) => Post.fromJson(model)).toList();
  return posts;
}

//

Future <List<Post>> fetchPost() async
{
  final  response = await http.get(Uri.parse('https://gist.githubusercontent.com/Ahmed29Ali/e5947e6ce7b856d966e6b51bbea1017c/raw/4f8da89916a5db493decd3a7f41f933892fe8512/STG%2520API.json'));
  if(response.statusCode   == 200)    {
    return compute(parsePost, response.body);

  }

  else
  {
    throw Exception("Request API ERROR");
  }
}
