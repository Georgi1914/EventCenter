import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../presentation/string_manager.dart';
import 'components/create_event_button.dart';
import 'components/custom_text_field.dart';
import 'components/date_time_row.dart';
import 'components/image_pick_widget.dart';
import 'create_event_view_model.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.createEventTitle),
        ),
        body: const CreateEventBody(),
      );
}

class CreateEventBody extends StatelessWidget {
  const CreateEventBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreateEventVM>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 36),
      child: Column(
        children: [
          CustomTextField(
            controller: viewModel.eventNameController,
            hint: AppStrings.eventName,
          ),
          CustomTextField(
            controller: viewModel.eventAddressController,
            hint: AppStrings.eventAddress,
          ),
          const DateTimeRow(),
          CustomTextField(
            controller: viewModel.eventDescriptionController,
            hint: AppStrings.description,
          ),
          const ImagePickWidget(),
          const Spacer(),
          const CreateEventButton()
        ],
      ),
    );
  }
}
