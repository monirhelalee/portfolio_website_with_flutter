import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';

class RowMenuWidget extends StatelessWidget {
  const RowMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _nameWidget(context, title: 'Home', onTap: () {}),
        AnimatedContainer(
          width: Responsive.isDesktop(context) ? 30 : 15,
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
        _nameWidget(context, title: 'About', onTap: () {}),
        AnimatedContainer(
          width: Responsive.isDesktop(context) ? 30 : 15,
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
        _nameWidget(context, title: 'Skills', onTap: () {}),
        AnimatedContainer(
          width: Responsive.isDesktop(context) ? 30 : 15,
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
        _nameWidget(context, title: 'Projects', onTap: () {}),
        AnimatedContainer(
          width: Responsive.isDesktop(context) ? 30 : 15,
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
        _nameWidget(context, title: 'Contact', onTap: () {}),
        AnimatedContainer(
          width: Responsive.isDesktop(context) ? 30 : 15,
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
        _nameWidget(context, title: 'Blog', onTap: () {
          context.go('/blog');
        }),
        AnimatedContainer(
          width: Responsive.isDesktop(context) ? 30 : 15,
          duration: const Duration(
            milliseconds: 100,
          ),
        ),
      ],
    );
  }

  Widget _nameWidget(context,
      {required String title, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: 18,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
