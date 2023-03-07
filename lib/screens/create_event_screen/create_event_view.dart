import 'package:flutter/material.dart';

import '../../presentation/string_manager.dart';
import 'components/custom_text_field.dart';
import 'components/date_time_row.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.createEventTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: const [
              CustomTextField(
                hint: AppStrings.eventName,
              ),
              CustomTextField(
                hint: AppStrings.eventAddress,
              ),
              DateTimeRow(),
              CustomTextField(
                hint: AppStrings.description,
              ),
            ],
          ),
        ),
      );
}
