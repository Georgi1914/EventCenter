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
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  final List<String> categories = [
                    'category1',
                    'category2',
                    'category3',
                    'category4',
                    'category5',
                  ];
                  int selectedFilterIndex = 0;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        categories[index],
                      ),
                      selected: selectedFilterIndex == index,
                      onSelected: (bool selected) {},
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 20,
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
          ],
        ),
      ),
    );
  }
}
