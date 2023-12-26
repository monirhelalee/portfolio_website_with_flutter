import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/widgets/exports.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _mySkills(context),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: Responsive.isMobile(context)
                ? MediaQuery.sizeOf(context).width
                : Responsive.isTablet(context)
                    ? MediaQuery.sizeOf(context).width / 1.2
                    : MediaQuery.sizeOf(context).width / 1.5,
            child: const Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: [
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/flutterio/flutterio-icon.svg',
                  title: 'Flutter',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/dartlang/dartlang-icon.svg',
                  title: 'Dart',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/firebase/firebase-icon.svg',
                  title: 'Firebase',
                ),
                SkillCartWidget(
                  iconPath: 'assets/postman.svg',
                  title: 'Postman',
                  isLink: false,
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg',
                  title: 'git',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/github/github-icon.svg',
                  title: 'Github',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/gitlab/gitlab-icon.svg',
                  title: 'Gitlab',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/sqlite/sqlite-icon.svg',
                  title: 'SqfLite',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/visualstudio_code/visualstudio_code-icon.svg',
                  title: 'VS code',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/android/android-icon.svg',
                  title: 'Android',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://upload.wikimedia.org/wikipedia/commons/9/95/Android_Studio_Icon_3.6.svg',
                  title: 'Android Studio',
                ),
                SkillCartWidget(
                  iconPath:
                      'https://www.vectorlogo.zone/logos/google_play/google_play-icon.svg',
                  title: 'Play Store',
                ),
                SkillCartWidget(
                  iconPath: 'assets/app-store.svg',
                  title: 'App Store',
                  isLink: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _mySkills(context) {
    return Text(
      'My Skills',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 48,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
    );
  }
}
