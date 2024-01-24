import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColumnMenuWidget extends StatelessWidget {
  const ColumnMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 50),
      color: Colors.blueGrey.shade900,
      child: Column(
        children: [
          _nameWidget(context, title: 'Home', onTap: () {}),
          const SizedBox(
            height: 30,
          ),
          _nameWidget(context, title: 'About', onTap: () {}),
          const SizedBox(
            height: 30,
          ),
          _nameWidget(context, title: 'Skills', onTap: () {}),
          const SizedBox(
            height: 30,
          ),
          _nameWidget(context, title: 'Projects', onTap: () {}),
          const SizedBox(
            height: 30,
          ),
          _nameWidget(context, title: 'Contact', onTap: () {}),
          const SizedBox(
            height: 30,
          ),
          _nameWidget(context, title: 'Blog', onTap: () {
            context.go('/blog');
          }),
        ],
      ),
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
