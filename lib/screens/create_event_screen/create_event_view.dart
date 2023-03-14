import 'package:flutter/material.dart';

import '../../presentation/string_manager.dart';
import 'components/create_event_button.dart';
import 'components/custom_text_field.dart';
import 'components/date_time_row.dart';
import 'components/image_pick_widget.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.createEventTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 36),
          child: Column(
            children: const [
              CustomTextField(
                controller: ,
                hint: AppStrings.eventName,
              ),
              CustomTextField(
                hint: AppStrings.eventAddress,
              ),
              DateTimeRow(),
              CustomTextField(
                hint: AppStrings.description,
              ),
              ImagePickWidget(),
              Spacer(),
              CreateEventButton()
            ],
          ),
        ),
      );
}
