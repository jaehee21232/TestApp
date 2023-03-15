import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:testapp/Home.dart';
import 'package:provider/provider.dart';
import 'package:testapp/model/counter_bloc.dart';
import 'package:testapp/model/fish_model.dart';
import 'package:testapp/model/seafish_model.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ko', ''),
        ],
        debugShowCheckedModeBanner: false,
        title: '연습',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: const Text("보기용"),
            centerTitle: true,
          ),
          body: HomeBuilder(),
        ),
      ),
    );
  }
}
