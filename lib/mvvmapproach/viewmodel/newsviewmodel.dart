
import 'package:smapproach/mvvmapproach/model/author_model.dart';

class NewsArticleViewModel{
  AuthorModel? model;

  NewsArticleViewModel({AuthorModel? news}) : model = news;

  String get author{
    return model!.author!;
  }

  String get title{
    return model!.title!;
  }
  String get description{
    return model!.description!;
  }
  String get url{
    return model!.url!;
  }
  String get urlToImage{
    return model!.urlToImage!;
  }
  String get publishedAt{
    return model!.publishedAt!;
  }
  String get content{
    return model!.content!;
  }
}