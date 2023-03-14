import 'package:flutter/material.dart';

import '../../../presentation/color_manager.dart';

class WrappedInDividersText extends StatelessWidget {
  const WrappedInDividersText({
    required this.text,
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            child: Divider(
              color: AppColors.brightGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          const Expanded(
            child: Divider(
              color: AppColors.brightGrey,
            ),
          ),
        ],
      );
}
