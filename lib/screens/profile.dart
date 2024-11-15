import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50], // Легкий фон
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.indigo, // Зміна кольору AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Вирівнювання зверху
          children: [
            // Заголовок
            Text(
              "User Profile",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[800],
              ),
            ),
            const SizedBox(height: 20),
            // Інформація про користувача
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.indigo,
                  child: Text(
                    "A", // Перша літера імені (можна зробити динамічно)
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ksenia Stefanko",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo[900],
                      ),
                    ),
                    Text(
                      "ksenia.stefanko@example.com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.indigo[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            // Опис або додаткові дані
            Text(
              "About Me",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.indigo[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "This is a placeholder text for the user's bio. You can add details about the user here.",
              style: TextStyle(fontSize: 16, color: Colors.indigo[700]),
            ),
            const SizedBox(height: 40),
            // Кнопка переходу на Home
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo, // Синя кнопка
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 12,
                  ),
                ),
                child: Text(
                  "Go to Home",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
