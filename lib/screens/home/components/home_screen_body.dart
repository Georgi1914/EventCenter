import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
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
                itemCount: viewModel.categoriesLength,
                itemBuilder: (_, int index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    selectedColor: AppColors.primaryPurple,
                    label: Text(
                      viewModel.getCategoryName(index),
                    ),
                    labelStyle: TextStyle(
                        color: viewModel.isSelected(index)
                            ? AppColors.white
                            : AppColors.primaryPurple),
                    selected: viewModel.isSelected(index),
                    onSelected: (bool selected) {
                      viewModel.setSelected(index);
                    },
                  ),
                ),
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
