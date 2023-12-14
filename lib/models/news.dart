class News {
  final int id;
  final String title;
  final String description;
  final DateTime createDate;
  final DateTime? updateDate;
  final String? imageUrl;
  final String sourceUrl;

  News({
    required this.id,
    required this.title,
    required this.description,
    required this.createDate,
    this.imageUrl,
    required this.sourceUrl,
    this.updateDate
  });
}
