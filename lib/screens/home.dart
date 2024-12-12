import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/action_button.dart';
import '../components/post_list.dart';
import '../cubit/post_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Викликаємо fetchPosts при рендері
    context.read<PostCubit>().fetchPosts();

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
          padding: const EdgeInsets.all(16.0),
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
                "Explore your dashboard and view the latest posts.",
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<PostCubit, PostState>(
                  builder: (context, state) {
                    if (state is PostLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is PostLoaded) {
                      return PostList(posts: state.posts);
                    } else if (state is PostError) {
                      return Center(
                        child: Text(
                          "Error: ${state.message}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }
                    return const Center(child: Text("No posts available"));
                  },
                ),
              ),
              const SizedBox(height: 5),
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
