import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/color_manager.dart';
import '../../../presentation/string_manager.dart';
import '../create_event_view_model.dart';

class ImagePickWidget extends StatelessWidget {
  const ImagePickWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CreateEventVM>();

    // return FloatingActionButton(onPressed: viewModel.pickImage);
    final image = viewModel.imageToDisplay;
    if (image != null) {
      return Image.file(image);
    } else {
      return ElevatedButton(
        onPressed: viewModel.pickImage,
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.primaryPurple),
        ),
        child: const Text(AppStrings.selectImage),
      );
    }
  }
}
