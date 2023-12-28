import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/widgets/exports.dart';

import 'view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    var homeVM = HomeViewModel.read(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: const NavigationBarWidget(),
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
          children: const [
            HomeWidget(),
            AboutWidget(),
            SkillsWidget(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
