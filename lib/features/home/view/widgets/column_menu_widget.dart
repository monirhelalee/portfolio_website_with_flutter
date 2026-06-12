import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';

class ColumnMenuWidget extends StatelessWidget {
  const ColumnMenuWidget({super.key, required this.onSectionTap});

  final Future<void> Function(int index) onSectionTap;

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
                  onTap: () async {
                    Navigator.pop(context);
                    await Future<void>.delayed(const Duration(milliseconds: 300));
                    await onSectionTap(index);
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
