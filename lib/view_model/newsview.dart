import 'package:news/models/categories.dart';
import 'package:news/repo/newsrepo.dart';
import 'package:news/models/headline.dart';

class NewsViewModel {
  final _rep = NewsRepository();

  Future<NewsChannelHeadlinesModel> fetchHeadline() async{
    final response = await _rep.fetchNewsChannelHeadlinesAPI();
    return response;
  }
   Future<CategoriesNewsModel> fetchCategoriesNewsApi(String category) async{
    final response = await _rep.fetchCategoriesNewsApi(category);
    return response;
  }
}
