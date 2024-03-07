import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/skills_widget.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/social_media_widget.dart';
import 'package:my_portfolio_flutter/features/home/view_model/home_view_model.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var homeVM = HomeViewModel.read(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Responsive.isDesktop(context) || Responsive.isTablet(context)
          ? Column(
              children: [
                _aboutMe(
                  context,
                ),
                const PillShapeUnderTitleWidget(),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 3,
                  child: Text(
                    Constant.aboutMeShort,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        _getToKnowMe(context),
                        const SizedBox(
                          height: 24,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3,
                              child: Text(
                                Constant.aboutMeLong,
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 18,
                                      color: Colors.white60,
                                    ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 3,
                              child: Text(
                                'Feel free to Connect or Follow: ',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      fontSize: 18,
                                      color: Colors.white60,
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ),
                            const SocialMediaWidget(),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        _mySkills(context),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2,
                          child: const SkillsWidget(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          : Column(
              children: [
                _aboutMe(
                  context,
                ),
                const PillShapeUnderTitleWidget(),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Text(
                    Constant.aboutMeShort,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    _getToKnowMe(context),
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Text(
                            Constant.aboutMeLong,
                            textAlign: TextAlign.left,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 18,
                                      color: Colors.white60,
                                    ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Text(
                            'Feel free to Connect or Follow: ',
                            textAlign: TextAlign.left,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 18,
                                      color: Colors.white60,
                                      fontStyle: FontStyle.italic,
                                    ),
                          ),
                        ),
                        const SocialMediaWidget(),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Column(
                  children: [
                    _mySkills(context),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: const SkillsWidget(),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _aboutMe(context) {
    return Text(
      'About Me',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 48,
            color: Colors.white,
          ),
    );
  }

  Widget _getToKnowMe(context) {
    return Text(
      'Get to know me!',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 24,
            color: Colors.white,
          ),
    );
  }

  Widget _mySkills(context) {
    return Text(
      'My skills',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 24,
            color: Colors.white,
          ),
    );
  }
}
