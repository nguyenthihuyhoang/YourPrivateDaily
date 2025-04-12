import 'package:flutter/material.dart';
import 'package:private_app/data/models/posts.dart';

class PostLayout extends StatelessWidget {
  const PostLayout({super.key, required this.post});
  final Posts post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(color: Colors.blue[100]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('${post.datetime}'),
              Spacer(),
              Text('${post.categories}'),
            ],
          ),
          Text('${post.title ?? ''}'),
          Text('${post.content ?? ''}'),
          if (post.image != null) Image.network('${post.image}'),
        ],
      ),
    );
  }
}
