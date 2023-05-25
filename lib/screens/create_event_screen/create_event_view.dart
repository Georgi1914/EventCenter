import 'package:flutter/material.dart';

import '../../presentation/string_manager.dart';
import 'components/create_event_body.dart';

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
