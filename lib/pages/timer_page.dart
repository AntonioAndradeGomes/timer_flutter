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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '60',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.play_arrow_rounded,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  Icons.refresh,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
