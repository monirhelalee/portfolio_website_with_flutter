abstract final class AppSpacing {
  static const double xs = 8;
  static const double sm = 16;
  static const double md = 24;
  static const double lg = 48;
  static const double xl = 80;
  static const double xxl = 120;

  static double sectionPadding(double width) {
    if (width >= 1100) return 80;
    if (width >= 750) return 48;
    return 24;
  }

  static double contentMaxWidth(double width) {
    if (width >= 1100) return 1200;
    return width;
  }
}
