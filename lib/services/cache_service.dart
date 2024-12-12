import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CacheService {
  static const String _userKey = 'user';
  static const String _postsKey = 'posts';

  Future<void> saveUser(Map<String, dynamic> user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_userKey, json.encode(user));
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

  Future<Map<String, dynamic>?> getUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userData = prefs.getString(_userKey);
      if (userData != null) {
        return json.decode(userData) as Map<String, dynamic>;
      }
    } catch (e) {
      print('Error getting user data: $e');
    }
    return null;
  }

  Future<void> clearUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_userKey);
    } catch (e) {
      print('Error clearing user data: $e');
    }
  }

  Future<void> savePosts(List<Map<String, dynamic>> posts) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_postsKey, json.encode(posts));
    } catch (e) {
      print('Error saving posts: $e');
    }
  }

  /// Отримує список постів
  Future<List<Map<String, dynamic>>?> getPosts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final postsData = prefs.getString(_postsKey);
      if (postsData != null) {
        final decodedData = json.decode(postsData) as List<dynamic>;
        return decodedData.map((post) {
          if (post is Map<String, dynamic>) {
            return Map<String, dynamic>.from(post);
          } else {
            throw FormatException('Invalid post format');
          }
        }).toList();
      }
    } catch (e) {
      print('Error getting posts: $e');
    }
    return null;
  }

  Future<void> clearPosts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_postsKey);
    } catch (e) {
      print('Error clearing posts: $e');
    }
  }
}
