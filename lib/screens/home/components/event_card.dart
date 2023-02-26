import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
import '../home_viewmodel.dart';
import 'address_row.dart';
import 'overflow_text_widget.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeVM>();
    final theme = Theme.of(context).textTheme;
    return DecoratedBox(
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
            OverflowTextWidget(
                text: viewModel.getEventName(index), style: theme.headline2),
            OverflowTextWidget(
              text: viewModel.formattedDate(index),
              style: theme.subtitle1,
            ),
            AddressRow(
              text: viewModel.getEventAddress(index),
              style: theme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
