class Lesson {
  final String lessonName;
  final String imageAsset;
  final String animationAsset;
  final String? audioAsset;
  final String? soundAsset;

  Lesson( {
    required this.lessonName,
    required this.imageAsset,
    required this.animationAsset,
    this.audioAsset,
    this.soundAsset,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      lessonName: json['lessonName'],
      imageAsset: json['imageAsset'],
      animationAsset: json['animationAsset'],
      audioAsset: json['audioAsset'],
      soundAsset: json['soundAsset'],
    );
  }
}
