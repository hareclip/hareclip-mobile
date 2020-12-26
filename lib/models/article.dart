class Article {
  final int id;
  final String contentsFileName;
  final String title;
  final String headerImageFileName;
  final int category;
  final int author;
  final DateTime dateCreated;
  final DateTime dateEdited;
  final int publisher;
  final DateTime dateVisible;
  final String imageCredit;
  final int categoryId;
  final String categoryLabel;
  final String authorFullName;
  final List<String> tags;

  Article({
    this.id,
    this.contentsFileName,
    this.title,
    this.headerImageFileName,
    this.category,
    this.author,
    this.dateCreated,
    this.dateEdited,
    this.publisher,
    this.dateVisible,
    this.imageCredit,
    this.categoryId,
    this.categoryLabel,
    this.authorFullName,
    this.tags,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      contentsFileName: json['contentsFileName'],
      title: json['title'],
      headerImageFileName: json['headerImageFileName'],
      authorFullName: json['authorFullName'],
      dateVisible: DateTime.parse(json['dateVisible']),
      categoryLabel: json['categoryLabel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'contentsFileName': contentsFileName,
      'title': title,
      'headerImageFileName': headerImageFileName,
      'authorFullName': authorFullName,
      'dateVisible': dateVisible.toIso8601String(),
      'categoryLabel': categoryLabel,
    };
  }
}
