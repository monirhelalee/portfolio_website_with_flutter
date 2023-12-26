import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/features/home/view_model/home_view_model.dart';

class RowMenuWidget extends StatelessWidget {
  const RowMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var homeVM = HomeViewModel.read(context);
    return Row(
      children: [
        _nameWidget(context, title: 'Home', onTap: () {}),
        const SizedBox(
          width: 30,
        ),
        _nameWidget(context, title: 'About', onTap: () {}),
        const SizedBox(
          width: 30,
        ),
        _nameWidget(context, title: 'Experience', onTap: () {}),
        const SizedBox(
          width: 30,
        ),
        _nameWidget(context, title: 'Projects', onTap: () {}),
        const SizedBox(
          width: 30,
        ),
        _nameWidget(context, title: 'Skills', onTap: () {}),
        const SizedBox(
          width: 30,
        ),
        _nameWidget(context, title: 'Contact', onTap: () {}),
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
