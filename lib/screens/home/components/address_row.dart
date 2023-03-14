import 'package:flutter/material.dart';

import '../../../presentation/color_manager.dart';
import '../../custom_widgets/overflow_text_widget.dart';

class AddressRow extends StatelessWidget {
  const AddressRow({
    required this.text,
    required this.style,
    required this.callback,
    required this.icon,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final VoidCallback callback;
  final IconData icon;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: AppColors.primaryPurple,
            size: 20,
          ),
          Expanded(
            child: OverflowTextWidget(
              text: text,
              style: style,
            ),
          ),
          GestureDetector(
            onTap: callback,
            child: Icon(
              icon,
              size: 24,
              color: AppColors.primaryPurple,
            ),
          )
        ],
      );
}
