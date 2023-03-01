import 'package:flutter/material.dart';

import '../../models/ui/event.dart';
import 'components/description_body.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({
    required this.event,
    super.key,
  });

  final DomainEvent event;

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          leading: const BackButton(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.favorite_outline),
              ),
            )
          ],
        ),
        body: DescriptionBody(event: event),
      );
}
