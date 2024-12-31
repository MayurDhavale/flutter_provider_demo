import 'package:flutter/material.dart';
import 'package:flutter_provider/counter_provider.dart';
import 'package:flutter_provider/list_map_provider.dart';
import 'package:flutter_provider/list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => ListMapProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("build function called");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Consumer(builder: (ctx, _, __) {
          print("Consumer build function called!!");
          return Text(
              '${Provider.of<CounterProvider>(ctx, listen: true).getCount()}');
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<CounterProvider>(context, listen: false)
                  .incrementCount();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<CounterProvider>(context, listen: false)
                  .decrementCount();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
