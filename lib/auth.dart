import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smapproach/main.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("State management experiment")),
      body: BlocBuilder<AuthCreate,String>(
        builder: (context,user){
          return InkWell(
              onTap: () async {
                 await context.read<AuthCreate>().success(User(name: "",passcode: ""));
                 if(user=="successful"){
                   debugPrint("true ::::: $user");
                 }
                   else{
                   debugPrint("false ::::: $user");
                 }
                },
              child: const Text("user"));
        },
      ),
    );
  }
}
