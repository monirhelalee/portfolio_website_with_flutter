import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewModel extends ChangeNotifier {
  static HomeViewModel read(BuildContext context) =>
      context.read<HomeViewModel>();

  static HomeViewModel watch(BuildContext context) =>
      context.watch<HomeViewModel>();

  final ScrollController scrollController = ScrollController();
  final Key sectionKey = const Key('aboutMe');
}
