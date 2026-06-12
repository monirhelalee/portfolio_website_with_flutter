import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewWidget extends StatelessWidget {
  const HomeViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final horizontalPadding = AppSpacing.sectionPadding(width);
    final isWide = Responsive.isDesktop(context) || Responsive.isTablet(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      child: Stack(
        children: [
          Positioned(
            top: -60,
            right: -40,
            child: Container(
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.photoBlue.withValues(alpha: 0.22),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -60,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.photoYellow.withValues(alpha: 0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              120,
              horizontalPadding,
              AppSpacing.xl,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: AppSpacing.contentMaxWidth(width),
                ),
                child: isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: _heroContent(context)),
                          const SizedBox(width: AppSpacing.lg),
                          Expanded(child: _heroPortrait(context)),
                        ],
                      )
                    : Column(
                        children: [
                          _heroPortrait(context),
                          const SizedBox(height: AppSpacing.lg),
                          _heroContent(context),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _heroContent(BuildContext context) {
    return Column(
      crossAxisAlignment:
          Responsive.isMobile(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.photoGreen.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.photoGreen.withValues(alpha: 0.35),
            ),
          ),
          child: AnimatedTextKit(
            isRepeatingAnimation: true,
            totalRepeatCount: 1000,
            animatedTexts: [
              TyperAnimatedText(
                'Hello, World! 👋',
                speed: const Duration(milliseconds: 80),
                textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: AppColors.photoYellow,
                      fontSize: 14,
                    ) ??
                    const TextStyle(color: AppColors.photoYellow),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment:
              Responsive.isMobile(context) ? WrapAlignment.center : WrapAlignment.start,
          children: [
            Text(
              "I'm ",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: Responsive.isMobile(context) ? 36 : 56,
                    height: 1.1,
                    color: AppColors.textPrimary,
                  ),
            ),
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.accentGradient.createShader(bounds),
              child: Text(
                'Monir Haider',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: Responsive.isMobile(context) ? 36 : 56,
                      height: 1.1,
                      color: Colors.white,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Senior Software Engineer',
          textAlign: Responsive.isMobile(context) ? TextAlign.center : TextAlign.start,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: Responsive.isMobile(context) ? 22 : 28,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Building polished mobile experiences with Flutter — from idea to App Store.',
          textAlign: Responsive.isMobile(context) ? TextAlign.center : TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 17,
                color: AppColors.textMuted,
              ),
        ),
        const SizedBox(height: AppSpacing.lg),
        ElevatedButton.icon(
          onPressed: _openResume,
          icon: const Icon(Icons.download_rounded, size: 20),
          label: const Text('Download Resume'),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.photoBlue,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _heroPortrait(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final frameWidth = isMobile ? 300.0 : 380.0;
    const aspectRatio = 4 / 5;

    return Center(
      child: Container(
        width: frameWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: AppColors.accentGradient,
          boxShadow: [
            BoxShadow(
              color: AppColors.photoBlue.withValues(alpha: 0.4),
              blurRadius: 48,
              offset: const Offset(0, 24),
            ),
            BoxShadow(
              color: AppColors.photoYellow.withValues(alpha: 0.15),
              blurRadius: 32,
              spreadRadius: -4,
            ),
          ],
        ),
        padding: const EdgeInsets.all(3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: Image.asset(
              Constant.profilePortrait,
              fit: BoxFit.cover,
              alignment: Alignment.centerRight,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openResume() async {
    final uri = Uri.parse(Constant.resumeDownloadLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
