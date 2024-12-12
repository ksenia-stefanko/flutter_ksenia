import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/api_service.dart';
import '../services/cache_service.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Map<String, dynamic>> posts;

  PostLoaded(this.posts);
}

class PostError extends PostState {
  final String message;

  PostError(this.message);
}

class PostCubit extends Cubit<PostState> {
  final ApiService apiService;
  final CacheService cacheService;

  PostCubit(this.apiService, this.cacheService) : super(PostInitial());

  Future<void> fetchPosts() async {
    emit(PostLoading()); 
    try {
      final posts = await apiService.fetchPosts();
      await cacheService.savePosts(posts);
      emit(PostLoaded(posts)); 
    } catch (error) {
      final cachedPosts = await cacheService.getPosts();
      if (cachedPosts != null) {
        emit(PostLoaded(List<Map<String, dynamic>>.from(cachedPosts)));
      } else {
        emit(PostError(error.toString())); 
      }
    }
  }
}
