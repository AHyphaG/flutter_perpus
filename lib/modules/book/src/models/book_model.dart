class Book {
  final String id;
  final String title;
  final String coverUrl;

  Book({required this.id, required this.title, required this.coverUrl});

  factory Book.fromJson(Map<String, dynamic> json) =>
      Book(id: json['id'], title: json['title'], coverUrl: json['cover_url']);
}
