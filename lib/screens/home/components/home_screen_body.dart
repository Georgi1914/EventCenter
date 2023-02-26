import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_viewmodel.dart';
import 'event_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeVM>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemCount: viewModel.eventsLength,
          itemBuilder: (BuildContext context, int index) =>
              EventCard(index: index),
        ),
      ),
    );
  }
}
