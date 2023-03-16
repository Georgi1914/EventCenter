import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/route_manager.dart';
import '../../../presentation/color_manager.dart';
import '../home_viewmodel.dart';
import 'event_card.dart';
import 'home_screen_filter.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeVM>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (viewModel.getMeNames().isNotEmpty)
                  const Icon(
                    Icons.person,
                    color: AppColors.primaryPurple,
                    size: 32,
                  )
                else
                  const SizedBox(),
                Text(
                  viewModel.getMeNames(),
                  style: Theme.of(context).textTheme.headline3,
                ),
                const Spacer(),
                if (viewModel.hasLogged)
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () =>
                        Navigator.pushNamed(context, RouteManager.createEvent),
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.primaryPurple,
                          width: 2.0,
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.primaryPurple,
                        size: 30.0,
                      ),
                    ),
                  )
                else
                  const SizedBox(),
              ],
            ),
            SingleChildScrollView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  viewModel.categoriesLength,
                  (index) => HomeScreenFilter(index: index),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: viewModel.eventsLength,
                itemBuilder: (BuildContext context, int index) =>
                    EventCard(index: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
