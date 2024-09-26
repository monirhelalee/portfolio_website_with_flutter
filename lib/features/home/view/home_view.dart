import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';
import 'package:scroll_pos/scroll_pos.dart';

import '../view_model/home_view_model.dart';

class HomeViewWidget extends StatefulWidget {
  const HomeViewWidget({
    super.key,
  });

  @override
  State<HomeViewWidget> createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    var homeVM = HomeViewModel.read(context);
    final controller = ScrollPosController(itemCount: 5);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: NavigationBarWidget(
          controller: controller,
        ),
        automaticallyImplyLeading: false,
        actions: [
          if (Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.only(
                right: 24,
              ),
              child: InkWell(
                onTap: () {
                  _key.currentState!.openEndDrawer();
                },
                child: const Icon(Icons.menu_rounded),
              ),
            )
          else
            Container(),
        ],
      ),
      endDrawer: const ColumnMenuWidget(),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          controller: controller,
          children: const [
            HomeViewWidget(),
            AboutViewWidget(),
            ExperienceViewWidget(),
            ProjectViewWidget(),
            BlogViewWidget(),
            FooterViewWidget(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
