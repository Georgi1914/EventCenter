import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
import '../home_viewmodel.dart';

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
          itemBuilder: (BuildContext context, int index) => Container(
            decoration: BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.primaryPurple,
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        viewModel.generatePicture(),
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    viewModel.getEventName(index),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    viewModel.formattedDate(index),
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryPurple,
                    ),
                  ),
                  Text(
                    viewModel.getEventAddress(index),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
