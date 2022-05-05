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
  final  response = await http.get(Uri.parse('https://gist.githubusercontent.com/amrali500/f6f888bb859d96eb185aceea849cf127/raw/c542bef9f8e16a7f48055db01d41e8024eae51f4/STGapi.json'));
  if(response.statusCode   == 200)    {
    return compute(parsePost, response.body);

  }

  else
  {
    throw Exception("Request API ERROR");
  }
}
