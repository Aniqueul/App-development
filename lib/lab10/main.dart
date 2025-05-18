import 'package:flutter/material.dart';
import 'feed_screen.dart';
import 'post.dart';

void main() => runApp(SocialMediaApp());

class SocialMediaApp extends StatefulWidget {
  @override
  _SocialMediaAppState createState() => _SocialMediaAppState();
}

class _SocialMediaAppState extends State<SocialMediaApp> {
  List<Post> posts = [];

  void addPost(Post post) {
    setState(() => posts.add(post));
  }

  void updatePost(Post updated) {
    final index = posts.indexWhere((p) => p.id == updated.id);
    if (index != -1) setState(() => posts[index] = updated);
  }

  void deletePost(String id) {
    setState(() => posts.removeWhere((p) => p.id == id));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FeedScreen(
        posts: posts,
        onAdd: addPost,
        onUpdate: updatePost,
        onDelete: deletePost,
      ),
    );
  }
}
