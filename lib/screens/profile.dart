import 'package:flutter/material.dart';
import '../repositories/user_repository_impl.dart';
import '../components/edit_name_dialog.dart';
import '../components/edit_email_dialog.dart';
import '../components/action_button.dart';
import '../components/user_info_block.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserRepositoryImpl userRepository = UserRepositoryImpl();

  String userName = "User Name";
  String userEmail = "user@example.com";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = await userRepository.getUser();
    if (user != null) {
      setState(() {
        userName = user['name']!;
        userEmail = user['email']!;
      });
    }
  }

  Future<void> _updateUserName(String newName) async {
    final user = await userRepository.getUser();
    if (user != null) {
      final email = user['email']!;
      final password = user['password']!;
      await userRepository.saveUser(email, password, newName);
      setState(() {
        userName = newName;
      });
    }
  }

  Future<void> _updateUserEmail(String newEmail) async {
    final user = await userRepository.getUser();
    if (user != null) {
      final name = user['name']!;
      final password = user['password']!;
      await userRepository.saveUser(newEmail, password, name);
      setState(() {
        userEmail = newEmail;
      });
    }
  }

  Future<void> _handleLogout() async {
    await userRepository.logout();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  Future<void> _handleDeleteAccount() async {
    await userRepository.clearUser();
    Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF6A11CB),
              Color(0xFF2575FC),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                "User Profile",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              UserInfoBlock(
                userName: userName,
                userEmail: userEmail,
                onEditName: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditNameDialog(
                      currentName: userName,
                      onNameSaved: _updateUserName,
                    ),
                  );
                },
                onEditEmail: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditEmailDialog(
                      currentEmail: userEmail,
                      onEmailSaved: _updateUserEmail,
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              Center(
                child: ActionButton(
                  text: "Logout",
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: _handleLogout,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ActionButton(
                  text: "Delete Account",
                  color: Colors.orange,
                  textColor: Colors.white,
                  onPressed: _handleDeleteAccount,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ActionButton(
                  text: "Return to Home",
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
