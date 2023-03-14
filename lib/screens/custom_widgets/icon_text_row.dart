import 'package:flutter/material.dart';

import '../../presentation/color_manager.dart';

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    required this.icon,
    required this.text,
    super.key,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: ColoredBox(
          color: AppColors.cardColor,
          child: Row(
            children: [
              Icon(
                icon,
                size: 36,
                color: AppColors.primaryPurple,
              ),
              Expanded(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline3,
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
        ),
      );
}
