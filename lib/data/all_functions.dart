import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/data/GetModel.dart';
import 'package:netflix/data/url.dart';

// =================== All - Carousel =====================================
List<GetModel> movieList = [];
Future<List<GetModel>> getMovieApi() async {
  final response = await http.get(Uri.parse('$allBaseUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      movieList.clear();

      for (Map<String, dynamic> i in data) {
        movieList.add(GetModel.fromJson(i));
      }
      return movieList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// =============================All Trending Movies ======================
List<GetModel> trendingMovieList = [];
Future<List<GetModel>> getTrendingMovieApi() async {
  final response =
      await http.get(Uri.parse('$trendingMoviesUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      trendingMovieList.clear();

      for (Map<String, dynamic> i in data) {
        trendingMovieList.add(GetModel.fromJson(i));
      }
      return trendingMovieList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

// =============================All Trending Movies ======================

List<GetModel> trendingTvShows = [];
Future<List<GetModel>> getTrendingTvApi() async {
  final response = await http.get(Uri.parse('$trendingTvUrl?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      trendingTvShows.clear();

      for (Map<String, dynamic> i in data) {
        trendingTvShows.add(GetModel.fromJson(i));
      }
      return trendingTvShows;
    } else {
      return [];
    }
  } else {
    return [];
  }
}
List<GetModel> upcomingMovieList = [];
Future<List<GetModel>> getUpcomingMovies() async {
  final response = await http.get(Uri.parse('$upcomingMovies?api_key=$apiKey'));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      upcomingMovieList.clear();

      for (Map<String, dynamic> i in data) {
        upcomingMovieList.add(GetModel.fromJson(i));
      }
      return upcomingMovieList;
    } else {
      return [];
    }
  } else {
    return [];
  }
}

//trending movies for fastlaugh
List<GetModel>fastLaughMovieList=[];
Future<List<GetModel>>trendingMovieFastLaugh()async{
  final response=await http.get(Uri.parse("$allBaseUrl?api_key=$apiKey"));
  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      print("success");
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      List<dynamic> data = jsonData['results'];

      fastLaughMovieList.clear();

      for (Map<String, dynamic> i in data) {
        fastLaughMovieList.add(GetModel.fromJson(i));
      }
      return fastLaughMovieList;
    } else {
      return [];
    }
  } else {
    return [];
  }
 
  
}
//////////////////serach
///
 List<GetModel> searchResultList = [];
Future< List<GetModel>> fetchSearchResults(String query) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query'));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        List<dynamic> data = jsonData['results'];
        // final movie=data[1];
        // final image=movie["backdrop_path"];

        //print(image);

       
          searchResultList.clear();

          for (Map<String, dynamic> i in data) {
            searchResultList.add(GetModel.fromJson(i));
          }
          return searchResultList;
      
      }else {
      return searchResultList;
    }
    }else {
      return searchResultList;
    }
  }