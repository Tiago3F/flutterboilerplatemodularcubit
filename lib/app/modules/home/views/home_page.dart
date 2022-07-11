import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/counter_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CounterCubit _counterCubit = Modular.get();

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: _counterCubit.decrement,
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: _counterCubit.increment,
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
              onPressed: (() {
                Modular.to.navigate('/products/');
              }),
              child: const Text("Entrar")),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Button Tapped:"),
            BlocBuilder<CounterCubit, int>(
              bloc: _counterCubit,
              builder: (context, count) {
                return Text(
                  "$count",
                  style: Theme.of(context).textTheme.headline3,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
