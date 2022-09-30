import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../viewmodel/newsviewmodel.dart';

class NewsGrid extends StatefulWidget {
  final List<NewsArticleViewModel> model;
  const NewsGrid({Key? key, required this.model}) : super(key: key);

  @override
  State<NewsGrid> createState() => _NewsGridState();
}

class _NewsGridState extends State<NewsGrid> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var article = widget.model[index];
        return GridTile(
          footer: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              article.title,
              style:const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
          ),
          child:   CachedNetworkImage(
            imageUrl: article.urlToImage,
            imageBuilder: (context, imageProvider) {
              return Container(

                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(),
              );

            },
            errorWidget: (context, url, error) {
              return const Center(
                child: Text(
                  'No Image Found',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        );
      },
      itemCount: widget.model.length,
    );
  }
}
