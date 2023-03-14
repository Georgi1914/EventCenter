import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/route_manager.dart';
import '../../../presentation/color_manager.dart';
import '../../custom_widgets/overflow_text_widget.dart';
import '../home_viewmodel.dart';
import 'address_row.dart';

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

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteManager.descriptionScreen,
            arguments: viewModel.getEvent(index));
      },
      child: DecoratedBox(
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
                  child: viewModel.getEventImage(index).isNotEmpty
                      ? Image.network(
                          viewModel.getEventImage(index),
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          width: double.maxFinite,
                          color: AppColors.red,
                          child: const Center(
                            child: Text(
                              'Unavailable image',
                            ),
                          ),
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
      ),
    );
  }
}
