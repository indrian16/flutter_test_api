import 'package:flutter_rest_api/model/post_model.dart';
import 'package:http/http.dart' as http;

String url = 'https://jsonplaceholder.typicode.com/posts';

Future<Post> getPost() async {

  final response = await http.get('$url/1');
  return postFromJson(response.body);
}