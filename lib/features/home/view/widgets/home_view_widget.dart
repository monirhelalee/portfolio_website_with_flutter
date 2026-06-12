import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
            top: -80,
            right: -60,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -100,
            left: -80,
            child: Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accentSecondary.withValues(alpha: 0.12),
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
                          Expanded(child: _heroImage(context)),
                        ],
                      )
                    : Column(
                        children: [
                          _heroContent(context),
                          const SizedBox(height: AppSpacing.md),
                          _heroImage(context),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accent.withValues(alpha: 0.3),
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
                      color: AppColors.accent,
                      fontSize: 14,
                    ) ??
                    const TextStyle(color: AppColors.accent),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
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
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: Responsive.isMobile(context) ? 22 : 28,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Building polished mobile experiences with Flutter — from idea to App Store.',
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
        ),
      ],
    );
  }

  Widget _heroImage(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Lottie.asset(
          'assets/image_background.json',
          height: Responsive.isMobile(context) ? 280 : 400,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/my2.png',
          height: Responsive.isMobile(context) ? 320 : 480,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Future<void> _openResume() async {
    final uri = Uri.parse(Constant.resumeDownloadLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
