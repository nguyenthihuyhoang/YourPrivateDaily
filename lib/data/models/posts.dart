import 'package:objectbox/objectbox.dart';

@Entity()
class Posts {
  @Id()
  late int id;
  String? title;
  String? content;
  String? image;
  late String datetime;
  String? categories;

  Posts({
    required this.id,
    this.title,
    this.content,
    this.image,
    required this.datetime,
    this.categories,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      title: json['title'] as String?,
      content: json['content'] as String?,
      image: json['image'] as String?,
      datetime: json['datetime'] as String,
      categories: json['categories'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'image': image,
      'datetime': datetime,
      'categories': categories,
    };
  }
}
