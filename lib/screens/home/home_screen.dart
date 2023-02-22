import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/get_it.dart';
import '../../data/requests.dart';
import 'home_viewmodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeVM>();
    return Scaffold(
      body: ColoredBox(
        color: Colors.red,
        child: SafeArea(
          child: ColoredBox(
              color: Theme.of(context).backgroundColor,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) => Text(
                  getIt<Requests>()
                      .getRequest('http://localhost:1337/api/events')
                      .toString(),
                ),
                // children: [
                //   Column(
                //     children: const [
                //       CircleAvatar(
                //         backgroundImage: NetworkImage(
                //           'https://img.favpng.com/7/7/21/pfc-levski-sofia-bc-levski-sofia-pfc-lokomotiv-plovdiv-first-professional-football-league-png-favpng-LqV2xLbsMkmrGgwi99kMSxf3D.jpg',
                //         ),
                //         minRadius: 24,
                //       ),
                //       Text('Title')
                //     ],
                //   ),
                //   Column(
                //     children: const [
                //       CircleAvatar(
                //         backgroundImage: NetworkImage(
                //           'https://img.favpng.com/7/7/21/pfc-levski-sofia-bc-levski-sofia-pfc-lokomotiv-plovdiv-first-professional-football-league-png-favpng-LqV2xLbsMkmrGgwi99kMSxf3D.jpg',
                //         ),
                //         minRadius: 24,
                //       ),
                //       Text('Title2')
                //     ],
                //   ),
                //   Column(
                //     children: const [
                //       CircleAvatar(
                //         backgroundImage: NetworkImage(
                //           'https://img.favpng.com/7/7/21/pfc-levski-sofia-bc-levski-sofia-pfc-lokomotiv-plovdiv-first-professional-football-league-png-favpng-LqV2xLbsMkmrGgwi99kMSxf3D.jpg',
                //         ),
                //         minRadius: 24,
                //       ),
                //       Text('Title3')
                //     ],
                //   ),
                //   Column(
                //     children: const [
                //       CircleAvatar(
                //         backgroundImage: NetworkImage(
                //           'https://img.favpng.com/7/7/21/pfc-levski-sofia-bc-levski-sofia-pfc-lokomotiv-plovdiv-first-professional-football-league-png-favpng-LqV2xLbsMkmrGgwi99kMSxf3D.jpg',
                //         ),
                //         minRadius: 24,
                //       ),
                //       Text('Title4')
                //     ],
                //   ),
                // ],
              )),
        ),
      ),
    );
  }
}
