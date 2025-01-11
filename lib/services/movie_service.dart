import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/movie.dart';

class MovieService {
  Future<List<Movie>> loadMovies() async {
    try {
      final String response = await rootBundle.loadString('lib/assets/movies.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      print('Error loading movies: $e');
      return [];
    }
  }
}
