import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';

class BlogView extends StatefulWidget {
  const BlogView({super.key});

  @override
  State<BlogView> createState() => _BlogViewState();
}

class _BlogViewState extends State<BlogView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
