import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/ui/event.dart';
import '../../custom_widgets/icon_text_row.dart';
import '../description_view_model.dart';

class DescriptionTextForms extends StatelessWidget {
  const DescriptionTextForms({
    required this.event,
    super.key,
  });

  final DomainEvent event;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DescriptionVM>();

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.name,
            style: Theme.of(context).textTheme.headline1,
          ),
          IconTextRow(
            icon: Icons.calendar_month,
            text: viewModel.formattedDate(event.date),
          ),
          IconTextRow(icon: Icons.location_pin, text: event.address),
          IconTextRow(
            icon: Icons.description_outlined,
            text: event.description,
          ),
        ],
      ),
    );
  }
}
