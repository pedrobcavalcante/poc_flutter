import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text('BLoC em Ação')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Text('Counter A (normal):',
                      style: TextStyle(fontSize: 20)),
                  Text('${state.counterA}',
                      style: const TextStyle(fontSize: 36)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementA());
                        },
                        child: const Text('+1'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementA());
                        },
                        child: const Text('-1'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text('Counter B (não negativo):',
                      style: TextStyle(fontSize: 20)),
                  Text('${state.counterB}',
                      style: const TextStyle(fontSize: 36)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(IncrementB());
                        },
                        child: const Text('+1'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(DecrementB());
                        },
                        child: const Text('-1'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
