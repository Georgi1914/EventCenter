import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';
import '../create_event_view_model.dart';

class DateTimeRow extends StatelessWidget {
  const DateTimeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final viewModel = context.watch<CreateEventVM>();
    final selectedDateTime = viewModel.getTimeAsString();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.maxFinite,
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: InkWell(
          onTap: () async {
            viewModel
              ..pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              )
              ..pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              )
              ..setPickedDate();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedDateTime ?? AppStrings.dateAndTime,
                style: theme.headline4,
              ),
              const Icon(
                Icons.calendar_month_outlined,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
