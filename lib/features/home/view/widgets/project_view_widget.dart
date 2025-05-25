import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';

class ProjectViewWidget extends StatelessWidget {
  const ProjectViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 48,
        ),
        _projects(context),
        const PillShapeUnderTitleWidget(),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                    ProjectCartWidget(
                      iconPath:
                          'https://play-lh.googleusercontent.com/xpF8JkKuR2pUKXVKcyLJ20jr3-y_z54QA28aKe6t1lIQPLia8mGF5bXTk9iOjuHS_bE=w480-h960-rw',
                      title: 'Tabby - AI Bookkeeper',
                      isSvg: false,
                      playStoreLink:
                          'https://play.google.com/store/apps/details?id=com.usetabby.app',
                      appStoreLink:
                          'https://apps.apple.com/us/app/tabby-ai-bookkeeper/id6743497417',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://play-lh.googleusercontent.com/4qiylGNgVdCTVqzJItOS3Nj52r23OXgX0evLXI7Fx_BAspNpe356RC0MXB6ef0veHTc=w480-h960-rw',
                      title: 'Smart Sohay',
                      isSvg: false,
                      playStoreLink:
                          'https://play.google.com/store/apps/details?id=com.smartsohay.education',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://play-lh.googleusercontent.com/07fxFTaHE3m-2-4dAKJEDSCPvh770ZBJgDJO9B8ieYI0E-wjS_z_y7vFzLQxobBG4jA-=w240-h480-rw',
                      title: 'Muslim Minds',
                      isSvg: false,
                      playStoreLink:
                          'https://play.google.com/store/apps/details?id=com.martechhouse.salahbd',
                      apkLink:
                          'https://apkpure.net/ramadan-bd-2023/com.martechhouse.salahbd',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://play-lh.googleusercontent.com/peKaWiLMPyQrbMeSKhYX7Y23hxwFaNwA7-0fJz7iJcTQZ3oXnHfLMPNGb_lUUpE1kfw5=w480-h960-rw',
                      title: 'ORCA Marine',
                      isSvg: false,
                      playStoreLink:
                          'https://play.google.com/store/apps/details?id=com.nodesdigitalbd.orcamarine',
                      apkLink:
                          'https://apkpure.net/orca-marine/com.nodesdigitalbd.orcamarine',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://play-lh.googleusercontent.com/BcVtmhXzsFik9R-J3qwa58M67U0NLWeQARURpDxzfzUlXoAswCR2GPewXaig9B6biA=w480-h960-rw',
                      title: 'We Telly-BD',
                      isSvg: false,
                      playStoreLink:
                          'https://play.google.com/store/apps/details?id=org.wetelly.wetelly',
                      appStoreLink:
                          'https://apps.apple.com/us/app/we-telly-bd/id6466303189',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://play-lh.googleusercontent.com/mY2r0_alAV1sIIaSkQn-_wsPBpyZsEtC1jjTmZWpb_PjuLq_Ior1yhDcUs7J0YSOOpYh=w480-h960-rw',
                      title: 'Agritech',
                      isSvg: false,
                      playStoreLink:
                          'https://play.google.com/store/apps/details?id=com.nodesdigitalbd.agritech',
                      apkLink:
                          'https://apkpure.net/agritech/com.nodesdigitalbd.agritech',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://play-lh.googleusercontent.com/9BiAJdmRgWvbkZmDxp20FojPLHDOy0SyoJPPqYNoy4NcWMLVGCf2TuyKRW-aMr5xhrHs=w480-h960-rw',
                      title: 'Rakhsaani',
                      isSvg: false,
                      appStoreLink:
                          'https://apps.apple.com/sa/app/rakhsaani/id1665444120',
                      apkLink:
                          'https://apkpure.net/rakhsaani/org.rakhsaani.app',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://play-lh.googleusercontent.com/JDCXkDuZEqnm2kZgc_UGaUeMS9CXCWJY2RGr2obpW4e4GdctnA8aqzbh87os63-2codG=w240-h480-rw',
                      title: 'JobXprss',
                      isSvg: false,
                      apkLink:
                          'https://apkpure.net/jobxprss/com.ishraak.jobxprss',
                      // playStoreLink:
                      //     'https://play.google.com/store/apps/details?id=com.ishraak.jobxprss',
                      // appStoreLink:
                      //     'https://apps.apple.com/in/app/jobxprss/id1528878611',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://image.winudf.com/v2/image1/Y29tLmlzaHJhYWsuc2tpbGx4cHJzc19pY29uXzE2MzIxMDEzODhfMDY4/icon.webp?w=280&fakeurl=1&type=.webp',
                      title: 'SkillXprss',
                      isSvg: false,
                      apkLink:
                          'https://apkpure.net/skillxprss/com.ishraak.skillxprss',
                      // playStoreLink:
                      //     'https://play.google.com/store/apps/details?id=com.ishraak.jobxprss',
                      // appStoreLink:
                      //     'https://apps.apple.com/in/app/jobxprss/id1528878611',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://image.winudf.com/v2/image1/Y29tLmFtYXJpc2Nob29sLmFtYXJpc2Nob29sX2ljb25fMTY2NDI4NTM1Ml8wMjg/icon.webp?w=280&fakeurl=1&type=.webp',
                      title: 'Amar iSchool',
                      isSvg: false,
                      apkLink:
                          'https://apkpure.net/amar-ischool/com.amarischool.amarischool',
                      // playStoreLink:
                      //     'https://play.google.com/store/apps/details?id=com.ishraak.jobxprss',
                      // appStoreLink:
                      //     'https://apps.apple.com/in/app/jobxprss/id1528878611',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://play-lh.googleusercontent.com/ziZdh_-IycQFxqlvdrlXC7y9o3YERbExHjIKsOCWzg_FBh5FkCIb2W3H0nbPBhFE0Q=w240-h480-rw',
                      title: 'PicScanner - PDF Maker',
                      isSvg: false,
                      // apkLink:
                      //     'https://apkpure.net/amar-ischool/com.amarischool.amarischool',
                      playStoreLink:
                          'https://play.google.com/store/apps/details?id=ltd.onesoft.pic_scanner_app',
                      // appStoreLink:
                      //     'https://apps.apple.com/in/app/jobxprss/id1528878611',
                    ),
                    ProjectCartWidget(
                      iconPath:
                          'https://github.com/monirhelalee/portfolio_website_with_flutter/blob/master/assets/labook.svg',
                      title: 'Labook',
                      isSvg: true,
                      apkLink:
                          'https://apkcombo.com/ar/labook-employee/com.labookempl.app/',
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _projects(context) {
    return Text(
      'Projects',
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontSize: 48,
            color: Colors.white,
          ),
    );
  }
}
