import 'package:flutter/material.dart';

class FuturePage extends StatelessWidget {
  const FuturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Future'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const FutureDemoPage(),
              ),
            ),
            child: const Text('Demonstrate FutureBuilder'),
          ),
        ),
      ),
    );
  }
}

class FutureDemoPage extends StatelessWidget {
  const FutureDemoPage({super.key});

  Future<String> getData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return "I am data";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Future Demo Page'),
        ),
        body: FutureBuilder(
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: const TextStyle(fontSize: 18),
                  ),
                );

              } else if (snapshot.hasData) {
                final data = snapshot.data as String;
                return Center(
                  child: Text(
                    data,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              }
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },

          future: getData(),
        ),
      ),
    );
  }
}
