import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<Map<String, dynamic>> fetchUser() async {
    final http.Response response = await http.get(Uri.parse('$baseUrl/users/1'));
    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception("Failed to fetch user");
    }
  }

  Future<List<Map<String, dynamic>>> fetchPosts() async {
    final http.Response response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body) as List<dynamic>;
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception("Failed to fetch posts");
    }
  }

  Future<Map<String, dynamic>> updateUserName(String newName) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/users/1'),
      body: json.encode({'name': newName}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception("Failed to update user name");
    }
  }

  Future<Map<String, dynamic>> updateUserEmail(String newEmail) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/users/1'),
      body: json.encode({'email': newEmail}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception("Failed to update user email");
    }
  }

  Future<void> deleteAccount() async {
    final response = await http.delete(Uri.parse('$baseUrl/users/1'));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete account");
    }
  }
}
