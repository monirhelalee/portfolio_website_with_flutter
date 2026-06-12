import 'package:flutter/material.dart';
import 'package:my_portfolio_flutter/core/expotrs.dart';
import 'package:my_portfolio_flutter/features/home/view/widgets/exports.dart';

class ProjectViewWidget extends StatelessWidget {
  const ProjectViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final padding = AppSpacing.sectionPadding(width);

    return Container(
      width: double.infinity,
      color: AppColors.background,
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
                title: 'Projects',
                subtitle:
                    'Mobile apps I have helped build and ship to production.',
              ),
              const SizedBox(height: AppSpacing.lg),
              const _ProjectGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  const _ProjectGrid();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: const [
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
          apkLink: 'https://apkpure.net/rakhsaani/org.rakhsaani.app',
        ),
        ProjectCartWidget(
          iconPath:
              'https://play-lh.googleusercontent.com/JDCXkDuZEqnm2kZgc_UGaUeMS9CXCWJY2RGr2obpW4e4GdctnA8aqzbh87os63-2codG=w240-h480-rw',
          title: 'JobXprss',
          isSvg: false,
          apkLink: 'https://apkpure.net/jobxprss/com.ishraak.jobxprss',
        ),
        ProjectCartWidget(
          iconPath:
              'https://image.winudf.com/v2/image1/Y29tLmlzaHJhYWsuc2tpbGx4cHJzc19pY29uXzE2MzIxMDEzODhfMDY4/icon.webp?w=280&fakeurl=1&type=.webp',
          title: 'SkillXprss',
          isSvg: false,
          apkLink: 'https://apkpure.net/skillxprss/com.ishraak.skillxprss',
        ),
        ProjectCartWidget(
          iconPath:
              'https://image.winudf.com/v2/image1/Y29tLmFtYXJpc2Nob29sLmFtYXJpc2Nob29sX2ljb25fMTY2NDI4NTM1Ml8wMjg/icon.webp?w=280&fakeurl=1&type=.webp',
          title: 'Amar iSchool',
          isSvg: false,
          apkLink:
              'https://apkpure.net/amar-ischool/com.amarischool.amarischool',
        ),
        ProjectCartWidget(
          iconPath:
              'https://play-lh.googleusercontent.com/ziZdh_-IycQFxqlvdrlXC7y9o3YERbExHjIKsOCWzg_FBh5FkCIb2W3H0nbPBhFE0Q=w240-h480-rw',
          title: 'PicScanner - PDF Maker',
          isSvg: false,
          playStoreLink:
              'https://play.google.com/store/apps/details?id=ltd.onesoft.pic_scanner_app',
        ),
        ProjectCartWidget(
          iconPath:
              'https://raw.githubusercontent.com/monirhelalee/portfolio_website_with_flutter/c6f9963f56253576b5f2deeb1fb7a81a70b122a1/assets/labook.svg',
          title: 'Labook Employee',
          isSvg: true,
          apkLink:
              'https://apkcombo.com/ar/labook-employee/com.labookempl.app/',
        ),
        ProjectCartWidget(
          iconPath:
              'https://raw.githubusercontent.com/monirhelalee/portfolio_website_with_flutter/c6f9963f56253576b5f2deeb1fb7a81a70b122a1/assets/labook.svg',
          title: 'Labook Asistencia de Empleados',
          isSvg: true,
          apkLink:
              'https://apkcombo.com/ar/labook-asistencia-de-empleados/com.labook.app/',
        ),
      ],
    );
  }
}
