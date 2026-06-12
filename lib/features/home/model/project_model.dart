import 'dart:convert';

import 'package:flutter/services.dart';

class ProjectItem {
  ProjectItem({
    required this.id,
    required this.title,
    required this.iconPath,
    this.shortDescription,
    this.description,
    this.contribution,
    this.category,
    this.featured = false,
    this.tags = const [],
    this.features = const [],
    this.screenshots = const [],
    this.highlights = const [],
    this.highlightsTitle = 'Highlights',
    this.isSvg = false,
    this.isLink = true,
    this.isAsset = false,
    this.showWebIcon = false,
    this.playStoreLink,
    this.appStoreLink,
    this.githubLink,
    this.apkLink,
    this.webLink,
  });

  final String id;
  final String title;
  final String iconPath;
  final String? shortDescription;
  final String? description;
  final String? contribution;
  final String? category;
  final bool featured;
  final List<String> tags;
  final List<ProjectFeature> features;
  final List<ProjectScreenshot> screenshots;
  final List<String> highlights;
  final String highlightsTitle;
  final bool isSvg;
  final bool isLink;
  final bool isAsset;
  final bool showWebIcon;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? githubLink;
  final String? apkLink;
  final String? webLink;

  bool get hasDetails =>
      (description != null && description!.isNotEmpty) ||
      (contribution != null && contribution!.isNotEmpty) ||
      features.isNotEmpty ||
      screenshots.isNotEmpty ||
      highlights.isNotEmpty;

  bool get hasStoreLinks =>
      playStoreLink != null ||
      appStoreLink != null ||
      apkLink != null ||
      webLink != null ||
      showWebIcon;

  factory ProjectItem.fromJson(Map<String, dynamic> json) {
    return ProjectItem(
      id: json['id'] as String,
      title: json['title'] as String,
      iconPath: json['iconPath'] as String,
      shortDescription: json['shortDescription'] as String?,
      description: json['description'] as String?,
      contribution: json['contribution'] as String?,
      category: json['category'] as String?,
      featured: json['featured'] as bool? ?? false,
      tags: (json['tags'] as List<dynamic>?)
              ?.map((tag) => tag as String)
              .toList() ??
          const [],
      features: (json['features'] as List<dynamic>?)
              ?.map(
                (item) => ProjectFeature.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      screenshots: (json['screenshots'] as List<dynamic>?)
              ?.map(
                (item) =>
                    ProjectScreenshot.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      highlights: (json['highlights'] as List<dynamic>?)
              ?.map((item) => item as String)
              .toList() ??
          const [],
      highlightsTitle: json['highlightsTitle'] as String? ?? 'Highlights',
      isSvg: json['isSvg'] as bool? ?? false,
      isLink: json['isLink'] as bool? ?? true,
      isAsset: json['isAsset'] as bool? ?? false,
      showWebIcon: json['showWebIcon'] as bool? ?? false,
      playStoreLink: json['playStoreLink'] as String?,
      appStoreLink: json['appStoreLink'] as String?,
      githubLink: json['githubLink'] as String?,
      apkLink: json['apkLink'] as String?,
      webLink: json['webLink'] as String?,
    );
  }
}

class ProjectFeature {
  const ProjectFeature({
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  factory ProjectFeature.fromJson(Map<String, dynamic> json) {
    return ProjectFeature(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }
}

class ProjectScreenshot {
  const ProjectScreenshot({
    required this.caption,
    required this.imagePath,
  });

  final String caption;
  final String imagePath;

  factory ProjectScreenshot.fromJson(Map<String, dynamic> json) {
    return ProjectScreenshot(
      caption: json['caption'] as String,
      imagePath: json['imagePath'] as String,
    );
  }
}

class ProjectRepository {
  ProjectRepository._();

  static const _assetPath = 'assets/projects.json';

  static Future<List<ProjectItem>> loadProjects() async {
    final jsonString = await rootBundle.loadString(_assetPath);
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    final projects = jsonMap['projects'] as List<dynamic>;

    return projects
        .map((item) => ProjectItem.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
