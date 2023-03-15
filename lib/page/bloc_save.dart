import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testapp/model/counter_bloc.dart';
import 'package:testapp/page/countbloc.dart';

class CounterSaveTestPage extends StatefulWidget {
  const CounterSaveTestPage({super.key});

  @override
  State<CounterSaveTestPage> createState() => _CounterSaveTestPageState();
}

class _CounterSaveTestPageState extends State<CounterSaveTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) => Center(
          child: Text("$state"),
        ),
      ),
    );
  }
}
