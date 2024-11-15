import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50], // Легкий фон
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.indigo, // Зміна кольору AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Заголовок
            Text(
              "Welcome to Home Page!",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[800],
              ),
            ),
            const SizedBox(height: 20),
            // Опис
            Text(
              "Explore your dashboard and manage your account settings. "
              "Use the button below to view or edit your profile.",
              style: TextStyle(fontSize: 16, color: Colors.indigo[700]),
            ),
            const SizedBox(height: 40),
            // Кнопка переходу до профілю
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
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
                  "Go to Profile",
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
