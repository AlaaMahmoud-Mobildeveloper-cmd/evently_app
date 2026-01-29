class TaskModel{
  String id;
  String categories;
  String title;
  String description;
  bool isFavorite;
  int date;
  String userId;

  TaskModel(
      {
        this.id = "",
        required this.categories,
        required this.title,
        required this.description,
        this.isFavorite = false,
        required this.date,
        required this.userId,
      }
      );

  TaskModel.fromJson(Map<String, dynamic> json):this(
    id: json["id"],
    categories: json["categories"],
    title: json["title"],
    description: json["description"],
    isFavorite: json["isFavorite"],
    date: json["date"],
    userId: json["userId"],
  );


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "categories": categories,
      "title": title,
      "description": description,
      "isFavorite": isFavorite,
      "date": date,
      "userId": userId,
    };
  }
}

