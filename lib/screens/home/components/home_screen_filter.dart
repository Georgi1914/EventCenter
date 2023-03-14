import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/font_manager.dart';
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
      padding: const EdgeInsets.only(right: 16),
      child: ChoiceChip(
        selectedColor: AppColors.primaryPurple,
        label: Text(
          viewModel.getCategoryName(index),
        ),
        labelStyle: TextStyle(
          fontSize: FontSize.s18,
          color: viewModel.isSelected(index)
              ? AppColors.white
              : AppColors.primaryPurple,
        ),
        selected: viewModel.isSelected(index),
        onSelected: (bool selected) {
          viewModel.setSelected(index);
        },
      ),
    );
  }
}
