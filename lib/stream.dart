import 'dart:async';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final StreamController _controller = StreamController();
  int _counter = 10;

  void startTimer() async{
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _counter--;
      _controller.sink.add(_counter);
      if(_counter<=0){
        timer.cancel();
        _controller.close();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
                initialData: _counter,
                stream: _controller.stream,
                builder: (context,snapshot){
                  return Text('${snapshot.data}');
                }
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              startTimer();
            }, child: const Text('Start Count Down'))
          ],
        ),
      ),
    );
  }
}