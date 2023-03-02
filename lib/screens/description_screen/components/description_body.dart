import 'package:flutter/material.dart';

import '../../../models/ui/event.dart';
import 'description_text_forms.dart';

class DescriptionBody extends StatelessWidget {
  const DescriptionBody({
    required this.event,
    super.key,
  });

  final DomainEvent event;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                event.image.url,
                fit: BoxFit.fitWidth,
              ),
            ),
            DescriptionTextForms(
              event: event,
            ),
          ],
        ),
      );
}
