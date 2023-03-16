import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/route_manager.dart';
import '../../presentation/color_manager.dart';
import '../../presentation/string_manager.dart';
import 'profile_view_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    required this.isUser,
    super.key,
  });
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ProfileVM>();
    return isUser
        ? Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      viewModel.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteManager.logInScreen,
                        (Route route) => false,
                      );
                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: AppColors.primaryPurple,
                          width: 2,
                        ),
                      ),
                    ),
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: AppColors.red,
                    ),
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        AppStrings.signOut,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.notLoggedIn,
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        backgroundColor: AppColors.primaryPurple,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            RouteManager.logInScreen, (Route route) => false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          AppStrings.signIn,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
