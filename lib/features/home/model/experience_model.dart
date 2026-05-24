import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExperienceItem {
  ExperienceItem({
    required this.company,
    required this.role,
    required this.startYear,
    required this.startMonth,
    required this.bubbleColor,
    required this.isCurrent,
    this.endYear,
    this.endMonth,
    this.isPresent = false,
  });

  final String company;
  final String role;
  final int startYear;
  final int startMonth;
  final int? endYear;
  final int? endMonth;
  final bool isPresent;
  final String bubbleColor;
  final bool isCurrent;

  factory ExperienceItem.fromJson(Map<String, dynamic> json) {
    return ExperienceItem(
      company: json['company'] as String,
      role: json['role'] as String,
      startYear: json['startYear'] as int,
      startMonth: json['startMonth'] as int,
      endYear: json['endYear'] as int?,
      endMonth: json['endMonth'] as int?,
      isPresent: json['isPresent'] as bool? ?? false,
      bubbleColor: json['bubbleColor'] as String,
      isCurrent: json['isCurrent'] as bool? ?? false,
    );
  }

  String get periodLabel => ExperiencePeriodFormatter.format(
        startYear: startYear,
        startMonth: startMonth,
        endYear: endYear,
        endMonth: endMonth,
        isPresent: isPresent,
      );

  Color get color => _bubbleColorFromName(bubbleColor);

  IconData get icon =>
      isCurrent ? Icons.work : Icons.work_history_rounded;

  static Color _bubbleColorFromName(String name) {
    return switch (name) {
      'green' => Colors.green,
      'lightGreen' => Colors.lightGreen,
      'yellow' => Colors.yellow,
      'purple' => Colors.purple,
      'blueAccent' => Colors.blueAccent,
      _ => Colors.grey,
    };
  }
}

class ExperienceRepository {
  ExperienceRepository._();

  static const _assetPath = 'assets/experience.json';

  static Future<List<ExperienceItem>> loadExperiences() async {
    final jsonString = await rootBundle.loadString(_assetPath);
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    final experiences = jsonMap['experiences'] as List<dynamic>;

    return experiences
        .map((item) => ExperienceItem.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

class ExperiencePeriodFormatter {
  ExperiencePeriodFormatter._();

  static const _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  static String format({
    required int startYear,
    required int startMonth,
    int? endYear,
    int? endMonth,
    bool isPresent = false,
  }) {
    final startLabel = '${_monthNames[startMonth - 1]} $startYear';
    final endLabel =
        isPresent ? 'present' : '${_monthNames[endMonth! - 1]} $endYear';

    final effectiveEndYear = isPresent ? DateTime.now().year : endYear!;
    final effectiveEndMonth = isPresent ? DateTime.now().month : endMonth!;

    final duration = _formatMonths(
      _monthsBetween(
        startYear,
        startMonth,
        effectiveEndYear,
        effectiveEndMonth,
      ),
    );

    return '$startLabel to $endLabel $duration';
  }

  static int _monthsBetween(
    int startYear,
    int startMonth,
    int endYear,
    int endMonth,
  ) {
    return (endYear - startYear) * 12 + (endMonth - startMonth);
  }

  static String _formatMonths(int totalMonths) {
    if (totalMonths <= 0) {
      return '(0 months)';
    }

    final years = totalMonths ~/ 12;
    final months = totalMonths % 12;
    final parts = <String>[];

    if (years > 0) {
      parts.add('$years ${years == 1 ? 'year' : 'years'}');
    }
    if (months > 0) {
      parts.add('$months ${months == 1 ? 'month' : 'months'}');
    }

    return '(${parts.join(' ')})';
  }
}
