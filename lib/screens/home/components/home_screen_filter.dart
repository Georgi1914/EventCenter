import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
import '../home_viewmodel.dart';

class HomeScreenFilter extends StatelessWidget {
  const HomeScreenFilter({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeVM>();

    return Padding(
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
    );
  }
}
