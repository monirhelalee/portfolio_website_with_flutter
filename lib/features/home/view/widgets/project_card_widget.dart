import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCartWidget extends StatefulWidget {
  const ProjectCartWidget({
    super.key,
    required this.iconPath,
    required this.title,
    this.isSvg = true,
    this.isLink = true,
    this.playStoreLink,
    this.appStoreLink,
    this.githubLink,
    this.apkLink,
  });

  final String iconPath;
  final String title;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? githubLink;
  final String? apkLink;
  final bool isSvg;
  final bool isLink;

  @override
  State<ProjectCartWidget> createState() => _ProjectCartWidgetState();
}

class _ProjectCartWidgetState extends State<ProjectCartWidget> {
  double deskHeight = 200;
  double iconSizeDesk = 100;
  double titleSizeDesk = 16;
  double storeHeight = 0;
  double scale = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (v) {
        if (v) {
          storeHeight = 30;
          scale = 1.1;
        } else {
          storeHeight = 0;
          scale = 1;
        }
        setState(() {});
      },
      hoverColor: Colors.transparent,
      child: Transform.scale(
        scale: scale,
        child: Container(
          height: deskHeight,
          width: deskHeight,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade900,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              widget.isSvg
                  ? (widget.isLink
                      ? SvgPicture.network(
                          widget.iconPath,
                          height: iconSizeDesk,
                          width: iconSizeDesk,
                          fit: BoxFit.fill,
                        )
                      : SvgPicture.asset(
                          widget.iconPath,
                          height: iconSizeDesk,
                          width: iconSizeDesk,
                          fit: BoxFit.fill,
                        ))
                  : Image.network(
                      widget.iconPath,
                      height: iconSizeDesk,
                      width: iconSizeDesk,
                      fit: BoxFit.fill,
                    ),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: titleSizeDesk,
                      color: Colors.white,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.playStoreLink != null)
                    InkWell(
                      onTap: () async {
                        String link = widget.playStoreLink ?? '';

                        if (await canLaunchUrl(Uri.parse(link))) {
                          await launchUrl(Uri.parse(link));
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      child: AnimatedContainer(
                        height: (defaultTargetPlatform == TargetPlatform.iOS ||
                                defaultTargetPlatform == TargetPlatform.android)
                            ? 30
                            : storeHeight,
                        width: (defaultTargetPlatform == TargetPlatform.iOS ||
                                defaultTargetPlatform == TargetPlatform.android)
                            ? 30
                            : storeHeight,
                        duration: const Duration(milliseconds: 100),
                        child: Image.network(
                          'https://img.icons8.com/fluency/96/google-play-store-new.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  if (widget.playStoreLink != null &&
                      widget.appStoreLink != null)
                    AnimatedContainer(
                      width: (defaultTargetPlatform == TargetPlatform.iOS ||
                              defaultTargetPlatform == TargetPlatform.android)
                          ? 30
                          : storeHeight,
                      duration: const Duration(milliseconds: 100),
                    ),
                  if (widget.appStoreLink != null)
                    InkWell(
                      onTap: () async {
                        String link = widget.appStoreLink ?? '';

                        if (await canLaunchUrl(Uri.parse(link))) {
                          await launchUrl(Uri.parse(link));
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      child: AnimatedContainer(
                        height: (defaultTargetPlatform == TargetPlatform.iOS ||
                                defaultTargetPlatform == TargetPlatform.android)
                            ? 30
                            : storeHeight,
                        width: (defaultTargetPlatform == TargetPlatform.iOS ||
                                defaultTargetPlatform == TargetPlatform.android)
                            ? 30
                            : storeHeight,
                        duration: const Duration(milliseconds: 100),
                        child: Image.network(
                          'https://img.icons8.com/fluency/144/apple-app-store.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  if (widget.appStoreLink != null && widget.apkLink != null)
                    AnimatedContainer(
                      width: (defaultTargetPlatform == TargetPlatform.iOS ||
                              defaultTargetPlatform == TargetPlatform.android)
                          ? 30
                          : storeHeight,
                      duration: const Duration(milliseconds: 100),
                    ),
                  if (widget.apkLink != null)
                    InkWell(
                      onTap: () async {
                        String link = widget.apkLink ?? '';

                        if (await canLaunchUrl(Uri.parse(link))) {
                          await launchUrl(Uri.parse(link));
                        } else {
                          throw 'Could not launch $link';
                        }
                      },
                      child: AnimatedContainer(
                        height: (defaultTargetPlatform == TargetPlatform.iOS ||
                                defaultTargetPlatform == TargetPlatform.android)
                            ? 30
                            : storeHeight,
                        width: (defaultTargetPlatform == TargetPlatform.iOS ||
                                defaultTargetPlatform == TargetPlatform.android)
                            ? 30
                            : storeHeight,
                        duration: const Duration(milliseconds: 100),
                        child: Image.network(
                          'https://img.icons8.com/external-bearicons-outline-color-bearicons/64/external-APK-file-extension-bearicons-outline-color-bearicons.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
