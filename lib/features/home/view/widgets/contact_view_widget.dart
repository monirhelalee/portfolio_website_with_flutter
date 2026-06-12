import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/social_media_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactViewWidget extends StatelessWidget {
  const ContactViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final padding = AppSpacing.sectionPadding(width);

    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: padding,
        vertical: AppSpacing.xl,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: AppSpacing.contentMaxWidth(width)),
          child: Column(
            children: [
              const SectionHeaderWidget(
                title: 'Contact',
                subtitle: "Let's build something great together.",
              ),
              const SizedBox(height: AppSpacing.lg),
              GlassCardWidget(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  children: [
                    Text(
                      'Open to freelance, full-time, and collaboration opportunities.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _launchEmail(),
                          icon: const Icon(Icons.email_outlined, size: 20),
                          label: const Text('Send Email'),
                        ),
                        OutlinedButton.icon(
                          onPressed: () => _launchWhatsApp(),
                          icon: const Icon(Icons.chat_outlined, size: 20),
                          label: const Text('WhatsApp'),
                        ),
                        OutlinedButton.icon(
                          onPressed: _openResume,
                          icon: const Icon(Icons.description_outlined, size: 20),
                          label: const Text('Resume'),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.md),
                    const SocialMediaWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'mdmonirhelale@gmail.com',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _launchWhatsApp() async {
    const contact = '+8801786416417';
    final uri = Uri.parse('https://wa.me/$contact');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _openResume() async {
    final uri = Uri.parse(Constant.resumeDownloadLink);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
