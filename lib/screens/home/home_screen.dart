import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeVM>();
    return Scaffold(
      body: ColoredBox(
        color: Colors.red,
        child: SafeArea(
          child: ColoredBox(
            color: Theme.of(context).backgroundColor,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: viewModel.events.length,
              itemBuilder: (BuildContext context, int index) => Text(
                viewModel.events[index].name,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
