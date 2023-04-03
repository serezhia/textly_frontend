import 'package:flutter/material.dart';
import 'package:textly_core/textly_core.dart';

class PostPage extends StatefulWidget {
  const PostPage({
    super.key,
    this.post,
    required this.postId,
  });

  final Post? post;
  final int postId;
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: Text('Post_page'),
    );
  }
}
