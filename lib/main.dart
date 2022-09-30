import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:smapproach/mvvmapproach/view/homeview.dart';
import 'package:smapproach/mvvmapproach/viewmodel/newslistarticle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Event approach',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
      /// THIS IS SAMPLE FOR MVVM ARCHITECTURE
      MultiProvider(
          providers: [
          ChangeNotifierProvider(
            create: (_) => NewArticleListViewModel(),
    )
    ],
    child: const HomeViewPage(),
    ),
      // BlocProvider(
      //     create: (_) => AuthCreate(),
      //     child: const AuthPage()),
    );
  }
}

class AuthCreate extends Cubit<String>{
  AuthCreate() : super("successful");

    success(User? user){
    if(user != null && user.name!.isNotEmpty && user.passcode!.isNotEmpty){
     emit("successful");
    }else {
      emit("failed");
    }
  }
  failure(User? user){
    if(user != null && user.name!.isNotEmpty && user.passcode!.isNotEmpty){
     emit("failed");
    }
  }

}

class User{
  final String? name;
  final String? passcode;
  User({this.name,this.passcode});
}