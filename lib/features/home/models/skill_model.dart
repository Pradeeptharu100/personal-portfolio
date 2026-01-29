class SkillModel {
  final String name;
  final SkillCategory category;
  final double proficiency; // 0.0 to 1.0
  final String? icon;

  const SkillModel({
    required this.name,
    required this.category,
    required this.proficiency,
    this.icon,
  });
}

enum SkillCategory { mobile, backend, tools, other }

extension SkillCategoryExtension on SkillCategory {
  String get displayName {
    switch (this) {
      case SkillCategory.mobile:
        return 'Mobile Development';
      case SkillCategory.backend:
        return 'Backend & Databases';
      case SkillCategory.tools:
        return 'Tools';
      case SkillCategory.other:
        return 'Other Skills';
    }
  }
}

class WorkExperience {
  final String title;
  final String company;
  final String location;
  final DateTime startDate;
  final DateTime? endDate;
  final List<String> responsibilities;

  const WorkExperience({
    required this.title,
    required this.company,
    required this.location,
    required this.startDate,
    this.endDate,
    required this.responsibilities,
  });

  bool get isCurrentRole => endDate == null;
}

class Education {
  final String institution;
  final String degree;
  final String? location;
  final String? status;

  const Education({
    required this.institution,
    required this.degree,
    this.location,
    this.status,
  });
}
