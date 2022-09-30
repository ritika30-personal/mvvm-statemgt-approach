import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:smapproach/mvvmapproach/model/author_model.dart';

class WebServices { 

    Future<List<AuthorModel>> fetchTopHeadLines() async { 

      final String response = await rootBundle.loadString('assets/json/datajson.json');
      final dtaRes = await json.decode(response);
      if (dtaRes != null) {
          final result = dtaRes['data'];
          Iterable list = result;
          return list.map((article) => AuthorModel.fromJson(article)).toList();
      } else {
          throw Exception("Failed to get top new");
      }
    }
}