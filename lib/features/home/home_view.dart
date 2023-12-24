import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/widgets/exports.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                const FlutterLogo(
                  size: 100,
                ),
                const Text(
                  'Md. Monir Haider Helalee',
                ),
                Text(
                  'Flutter Developer',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
