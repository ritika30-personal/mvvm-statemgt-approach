import 'package:flutter/material.dart';
import 'package:smapproach/mvvmapproach/model/author_model.dart';
import 'package:smapproach/mvvmapproach/model/serives/web_services.dart';
import 'package:smapproach/mvvmapproach/viewmodel/newsviewmodel.dart';

enum LoadingStatus { completed, searching, empty }

class NewArticleListViewModel with ChangeNotifier{
  LoadingStatus status = LoadingStatus.empty;
  List<NewsArticleViewModel>? newArticle;

  void topHeadings() async {
     var authorList = await WebServices().fetchTopHeadLines();
     status = LoadingStatus.searching;
     notifyListeners();

     newArticle = authorList.map((e) => NewsArticleViewModel(news: e)).toList();

     if(newArticle!.isEmpty) {
       status = LoadingStatus.empty;
     } else {
       status = LoadingStatus.completed;
     }

     notifyListeners();
  }

}