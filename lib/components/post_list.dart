import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  final List<Map<String, dynamic>> posts;

  const PostList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final String title = posts[index]['title']?.toString() ?? 'No Title';
        final String body = posts[index]['body']?.toString() ?? 'No Content';

        return Card(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 5.0,
          ),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  body,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
