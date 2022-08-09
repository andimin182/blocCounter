import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const MyHomePage(title: 'Bloc Counter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text('${state.value}');
            },
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  context.read<CounterBloc>().add(const IncrementEvent());
                },
                child: const Text('+1'),
              ),
              TextButton(
                onPressed: () {
                  context.read<CounterBloc>().add(const DecrementEvent());
                },
                child: const Text('-1'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
