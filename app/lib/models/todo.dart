class Todo {
  Todo({required this.id, required this.title, required this.description});
  int id;
  final String title;
  final String description;
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }
}
