class TipsModel {
  final String title;
  final String description;

  TipsModel({required this.title, required this.description});

  factory TipsModel.fromJson(Map<String, dynamic> json) {
    return TipsModel(
      title: json['title'],
      description: json['description'],
    );
  }
}
