import 'package:flutter/material.dart';
import 'package:learn_futures_streams/future.dart';
import 'package:learn_futures_streams/stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark
        ),
        home: const HomePage()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body:Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FilledButton(
                onPressed:() {Navigator.push(context,MaterialPageRoute(builder: (context) => const FuturePage()));},
                child: const Text("Future example")
              ),
              
              FilledButton(
                onPressed:() {Navigator.push(context,MaterialPageRoute(builder: (context) => const CounterPage()));},
                child: const Text("Stream example")
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}


