import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:scroll_pos/scroll_pos.dart';

class ColumnMenuWidget extends StatelessWidget {
  const ColumnMenuWidget({super.key, required this.controller});

  final ScrollPosController controller;

  static const _items = [
    ('Home', 0),
    ('About', 1),
    ('Experience', 2),
    ('Projects', 3),
    ('Contact', 4),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Menu',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: AppSpacing.md),
              for (final (title, index) in _items) ...[
                ListTile(
                  title: Text(title),
                  onTap: () {
                    Navigator.pop(context);
                    if (index == 0) {
                      controller.scrollToStart(animate: true);
                    } else {
                      controller.scrollToItem(index, animate: true);
                    }
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
