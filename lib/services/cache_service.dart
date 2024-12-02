import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  Future<void> savePosts(List<dynamic> posts) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('posts', json.encode(posts));
  }

  Future<List<dynamic>?> getPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final postsData = prefs.getString('posts');
    if (postsData != null) {
      return json.decode(postsData) as List<dynamic>;
    }
    return null;
  }
}
