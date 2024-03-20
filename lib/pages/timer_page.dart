import 'package:flutter/material.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cronomêtro',
        ),
      ),
      body: Column(
        children: [
          Text(
            '60',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Row(
            children: [
              FloatingActionButton(
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
