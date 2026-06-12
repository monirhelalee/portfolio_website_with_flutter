import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/core/utils/section_scroller.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  static const _sectionCount = 5;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final GlobalKey _navBarKey = GlobalKey();
  final GlobalKey _columnKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys =
      List.generate(_sectionCount, (_) => GlobalKey());

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollToSection(int index) async {
    if (!_scrollController.hasClients) return;

    await SectionScroller.scrollTo(
      scrollController: _scrollController,
      sectionKey: _sectionKeys[index],
      columnKey: _columnKey,
      topInset: _topScrollInset(),
    );
  }

  double _topScrollInset() {
    final navBarBox =
        _navBarKey.currentContext?.findRenderObject() as RenderBox?;

    if (navBarBox != null && navBarBox.hasSize) {
      final navBottom =
          navBarBox.localToGlobal(Offset(0, navBarBox.size.height)).dy;
      return navBottom + AppSpacing.xs;
    }

    return MediaQuery.paddingOf(context).top + 88;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      endDrawer: ColumnMenuWidget(onSectionTap: _scrollToSection),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            child: Column(
              key: _columnKey,
              children: [
                KeyedSubtree(
                  key: _sectionKeys[0],
                  child: const HomeViewWidget(),
                ),
                KeyedSubtree(
                  key: _sectionKeys[1],
                  child: const AboutViewWidget(),
                ),
                KeyedSubtree(
                  key: _sectionKeys[2],
                  child: const ExperienceViewWidget(),
                ),
                KeyedSubtree(
                  key: _sectionKeys[3],
                  child: const ProjectViewWidget(),
                ),
                KeyedSubtree(
                  key: _sectionKeys[4],
                  child: const ContactViewWidget(),
                ),
                const FooterViewWidget(),
              ],
            ),
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
                  key: _navBarKey,
                  onSectionTap: _scrollToSection,
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
