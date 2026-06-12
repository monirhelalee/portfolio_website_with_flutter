import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';
import 'package:scroll_pos/scroll_pos.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late final ScrollPosController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollPosController(itemCount: 5);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      endDrawer: ColumnMenuWidget(controller: _scrollController),
      body: Stack(
        children: [
          ListView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            children: const [
              HomeViewWidget(),
              AboutViewWidget(),
              ExperienceViewWidget(),
              ProjectViewWidget(),
              ContactViewWidget(),
              FooterViewWidget(),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sectionPadding(
                    MediaQuery.sizeOf(context).width,
                  ),
                  vertical: AppSpacing.sm,
                ),
                child: NavigationBarWidget(
                  controller: _scrollController,
                  onMenuTap: () =>
                      _scaffoldKey.currentState?.openEndDrawer(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
