import 'package:flutter/material.dart';

import '../../../presentation/string_manager.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(96, 0, 96, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                AppStrings.accountNotCreated,
              ),
            ),
            const Expanded(
              child: Divider(),
            ),
          ],
        ),
      );
}
