import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Future? _operation;
  CancelationToken? _cancelationToken;

  void _startOperation() {
    if (_operation != null) {
      _stopOperation();
    }
    setState(() {
      _counter = 0;
      final token = CancelationToken();
      _cancelationToken = token;
      _operation = _operationFunction(token);
    });
  }

  void _stopOperation() {
    setState(() {
      _cancelationToken?.cancel();
      _operation = null;
    });
  }

  Future<void> _operationFunction(CancelationToken cancelationToken) async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (cancelationToken.isCanceled) return;
      setState(() {
        _counter = i;
      });
    }
    _stopOperation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _operation != null
                  ? 'Operation in progress'
                  : 'There is no operation in progress',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _startOperation,
            tooltip: 'Start',
            child: const Text('Start'),
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            onPressed: _stopOperation,
            tooltip: 'Stop',
            child: const Text('Stop'),
          ),
        ],
      ),
    );
  }
}

class CancelationToken {
  bool _isCanceled = false;
  bool get isCanceled => _isCanceled;
  void cancel() => _isCanceled = true;
}
