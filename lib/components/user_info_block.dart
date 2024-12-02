import 'package:flutter/material.dart';

class UserInfoBlock extends StatelessWidget {
  final String userName;
  final String userEmail;
  final VoidCallback onEditName;
  final VoidCallback onEditEmail;

  const UserInfoBlock({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.onEditName,
    required this.onEditEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 45,
            backgroundColor: Colors.indigo,
            child: Text(
              userName[0],
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: onEditName,
                  icon: Icon(Icons.edit, color: Colors.white70),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  userEmail,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                IconButton(
                  onPressed: onEditEmail,
                  icon: Icon(Icons.edit, color: Colors.white70),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
