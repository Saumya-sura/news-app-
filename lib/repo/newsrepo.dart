import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/categories.dart';
import 'package:news/models/headline.dart';

class NewsRepository {
  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesAPI() async {
    String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=00d425fc01ee4ccbb8b34e76d604d35a';
    final res = await http.get(Uri.parse(url));
    if(kDebugMode){
      print(res.body);
    
    }
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('Failed to load data');
  }
  Future<CategoriesNewsModel> fetchCategoriesNewsApi (String category ) async {
    String url = 'https://newsapi.org/v2/everything?q=${category}&apiKey=00d425fc01ee4ccbb8b34e76d604d35a';
    final res = await http.get(Uri.parse(url));
    if(kDebugMode){
      print(res.body);
    
    }
    if (res.statusCode == 200) {
      final body = jsonDecode(res.body);
      return CategoriesNewsModel.fromJson(body);
    }
    throw Exception('Failed to load data');
  }
}
