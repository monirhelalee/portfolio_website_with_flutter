import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:scroll_pos/scroll_pos.dart';

class RowMenuWidget extends StatelessWidget {
  const RowMenuWidget({super.key, required this.controller});

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
    return Row(
      children: [
        for (final (title, index) in _items) ...[
          _NavItem(
            title: title,
            onTap: () {
              if (index == 0) {
                controller.scrollToStart(animate: true);
              } else {
                controller.scrollToItem(index, animate: true);
              }
            },
          ),
          if (index < _items.length - 1)
            SizedBox(width: Responsive.isDesktop(context) ? 8 : 4),
        ],
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(8),
        hoverColor: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accent.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 14,
                  color: _hovered ? AppColors.accent : AppColors.textSecondary,
                ),
          ),
        ),
      ),
    );
  }
}
