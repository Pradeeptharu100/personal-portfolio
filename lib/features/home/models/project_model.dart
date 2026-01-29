class ProjectModel {
  final String id;
  final String name;
  final String description;
  final String? longDescription;
  final List<String> technologies;
  final String? playStoreUrl;
  final String? githubUrl;
  final String? websiteUrl;
  final String? imageUrl;
  final ProjectType type;
  final String? company;
  final String? slug;
  final DateTime? startDate;
  final DateTime? endDate;

  const ProjectModel({
    required this.id,
    required this.name,
    required this.description,
    this.longDescription,
    required this.technologies,
    this.playStoreUrl,
    this.githubUrl,
    this.websiteUrl,
    this.imageUrl,
    required this.type,
    this.company,
    this.slug,
    this.startDate,
    this.endDate,
  });

  bool get isOngoing => endDate == null && startDate != null;
}

enum ProjectType { professional, freelance, personal }

extension ProjectTypeExtension on ProjectType {
  String get displayName {
    switch (this) {
      case ProjectType.professional:
        return 'Professional';
      case ProjectType.freelance:
        return 'Freelance';
      case ProjectType.personal:
        return 'Personal';
    }
  }
}
