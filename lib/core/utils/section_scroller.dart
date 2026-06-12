import 'package:flutter/widgets.dart';

abstract final class SectionScroller {
  static Future<void> scrollTo({
    required ScrollController scrollController,
    required GlobalKey sectionKey,
    required GlobalKey columnKey,
    double topInset = 0,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
  }) async {
    if (!scrollController.hasClients) return;

    double? target;
    for (var attempt = 0; attempt < 5; attempt++) {
      await WidgetsBinding.instance.endOfFrame;
      target = offsetForKey(
        sectionKey,
        columnKey: columnKey,
        topInset: topInset,
      );
      if (target != null) break;
      await Future<void>.delayed(const Duration(milliseconds: 16));
    }

    if (target == null) return;

    await scrollController.animateTo(
      target.clamp(0.0, scrollController.position.maxScrollExtent),
      duration: duration,
      curve: curve,
    );
  }

  static double? offsetForKey(
    GlobalKey key, {
    required GlobalKey columnKey,
    double topInset = 0,
  }) {
    final sectionContext = key.currentContext;
    final columnContext = columnKey.currentContext;
    if (sectionContext == null || columnContext == null) return null;

    final sectionBox = sectionContext.findRenderObject();
    final columnBox = columnContext.findRenderObject();
    if (sectionBox is! RenderBox ||
        columnBox is! RenderBox ||
        !sectionBox.hasSize ||
        !columnBox.hasSize) {
      return null;
    }

    final sectionTopInColumn = columnBox
        .globalToLocal(sectionBox.localToGlobal(Offset.zero))
        .dy;

    return sectionTopInColumn - topInset;
  }
}
