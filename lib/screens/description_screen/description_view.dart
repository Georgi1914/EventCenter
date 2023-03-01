import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global_variables.dart';
import '../../models/ui/event.dart';
import '../custom_widgets/icon_text_row.dart';
import 'description_view_model.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({
    required this.event,
    super.key,
  });

  final DomainEvent event;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DescriptionVM>();
    final theme = Theme.of(context).textTheme;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          leading: const BackButton(),
          actions: [Icon(Icons.favorite)],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  imageUrls[Random().nextInt(imageUrls.length)],
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
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
              ),
            ],
          ),
        ));
  }
}
