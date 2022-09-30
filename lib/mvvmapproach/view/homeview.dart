import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smapproach/mvvmapproach/view/newsview.dart';
import 'package:smapproach/mvvmapproach/viewmodel/newslistarticle.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {

  @override
  void initState() {
    Provider.of<NewArticleListViewModel>(context, listen: false).topHeadings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listviewModel = Provider.of<NewArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News HeadLine'),
      ),
      body: NewsGrid(model: listviewModel.newArticle!!),
    );
  }
}
