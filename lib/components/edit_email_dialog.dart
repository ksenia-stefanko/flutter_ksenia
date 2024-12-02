import 'package:flutter/material.dart';

class EditEmailDialog extends StatelessWidget {
  final String currentEmail;
  final Function(String) onEmailSaved;

  const EditEmailDialog({
    Key? key,
    required this.currentEmail,
    required this.onEmailSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController =
        TextEditingController(text: currentEmail);

    return AlertDialog(
      title: const Text("Edit Email"),
      content: TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: "Enter new email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            final newEmail = emailController.text.trim();
            if (newEmail.isNotEmpty && newEmail.contains('@')) {
              onEmailSaved(newEmail);
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Invalid email address!'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
