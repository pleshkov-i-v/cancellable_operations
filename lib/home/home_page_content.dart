import 'package:flutter/material.dart';

class HomePageContent extends StatefulWidget {
  const HomePageContent({super.key});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('There is no operation in progress'),
        Text('$_counter', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () async {
                for (int i = 0; i < 10; i++) {
                  await Future.delayed(const Duration(milliseconds: 500));
                  setState(() {
                    _counter = i;
                  });
                }
              },
              tooltip: 'Start',
              child: const Text('Start'),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () {},
              tooltip: 'Stop',
              child: const Text('Stop'),
            ),
          ],
        ),
      ],
    );
  }
}
