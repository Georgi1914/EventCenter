import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Text('Select Image'),
      );
    }
  }
}
