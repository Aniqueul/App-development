import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'post.dart';
import 'upload_screen.dart';
import 'update_screen.dart';

class FeedScreen extends StatelessWidget {
  final List<Post> posts;
  final Function(Post) onAdd;
  final Function(Post) onUpdate;
  final Function(String) onDelete;

  FeedScreen({
    required this.posts,
    required this.onAdd,
    required this.onUpdate,
    required this.onDelete,
  });

  void downloadImage(BuildContext context, String path) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final bytes = await File(path).readAsBytes();
      final directory = await getExternalStorageDirectory();
      final filename = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      final file = File("${directory!.path}/$filename");
      await file.writeAsBytes(bytes);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Image downloaded successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feed'), actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => UploadScreen(onAdd: onAdd)),
            );
          },
        ),
      ]),
      body: posts.isEmpty
          ? Center(child: Text('Tap + to add your first post!'))

          : ListView.builder(
        itemCount: posts.length,
        itemBuilder: (ctx, i) {
          final post = posts[i];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(post.title),
              subtitle: Text(post.description),
              leading: GestureDetector(
                onLongPress: () => downloadImage(context, post.imagePath),
                child: Image.file(
                  File(post.imagePath),
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UpdateScreen(
                            post: post,
                            onUpdate: onUpdate,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text('Delete Post'),
                          content: Text('Are you sure you want to delete this post?'),
                          actions: [
                            TextButton(onPressed: () => Navigator.pop(context), child: Text('No')),
                            TextButton(
                              onPressed: () {
                                onDelete(post.id);
                                Navigator.pop(context);
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
