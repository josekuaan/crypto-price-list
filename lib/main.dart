import 'package:dex/bloc/History/bloc/history_bloc.dart';
import 'package:dex/ui/screens/history_screen.dart';
// import 'package:dex/ui/shared/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => HistoryBloc(),
        child: const HistoryScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
