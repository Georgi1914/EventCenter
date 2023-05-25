import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/route_manager.dart';
import '../../../presentation/color_manager.dart';
import '../create_event_view_model.dart';

class CreateEventButton extends StatelessWidget {
  const CreateEventButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreateEventVM>();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          await viewModel.createEvent();
          Navigator.popAndPushNamed(
            context,
            RouteManager.navigation,
            arguments: true,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            'Create event',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ),
    );
  }
}
