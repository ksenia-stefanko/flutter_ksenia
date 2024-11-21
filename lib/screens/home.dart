import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../components/action_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ConnectivityResult _connectivityResult;
  late Stream<ConnectivityResult> _connectivityStream;

  @override
  void initState() {
    super.initState();
    _connectivityStream = Connectivity().onConnectivityChanged;
    _initializeConnectivity();
  }

  Future<void> _initializeConnectivity() async {
    _connectivityResult = await Connectivity().checkConnectivity();
    if (_connectivityResult == ConnectivityResult.none) {
      _showNetworkError();
    }
    _connectivityStream.listen((result) {
      if (result == ConnectivityResult.none) {
        _showNetworkError();
      }
    });
  }

  void _showNetworkError() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("No Internet Connection"),
        content: const Text(
          "Your connection to the internet has been lost. Please reconnect to continue.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
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
                "Welcome to Home Page!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Explore your dashboard and manage your account settings. "
                "Use the button below to view your profile.",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 40),
              Center(
                child: ActionButton(
                  text: "Go to Profile",
                  color: Colors.white,
                  textColor: Colors.indigo,
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
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
